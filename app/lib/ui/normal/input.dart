import 'package:calculator_app/database/db.dart';
import 'package:calculator_app/ui/history/history_class.dart';
import 'package:calculator_app/ui/symbols.dart';
import 'package:calculator_app/services/calculate_logic.dart';
import 'package:calculator_app/services/shared_functions.dart';
import 'package:flutter/material.dart';

//-----------------------------------InputDisplay-----------------------------------
class InputDisplay extends StatefulWidget {
  const InputDisplay({super.key});

  @override
  State<InputDisplay> createState() => _InputDisplayState();
}
//

class _InputDisplayState extends State<InputDisplay> {
  TextEditingController inputTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Calculate calculate = Calculate.instance;
  final SharedFunctions sharedFunctions = SharedFunctions.instance;
  List<String> inputList = [];

//

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 50), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // DisplayHandling fuctions

  getListPosition(int pos) {
    int p = pos;
    if (pos == 0) {
      return 0;
    }
    int i = 0, j = 0;
    while (i + inputList[j].length < pos) {
      p -= inputList[j].length - 1;
      i += inputList[j].length;
      j++;
    }
    p -= pos - i - 1;
    return p;
  }

  correctPosition(int pos) {
    List<String> l = inputList.sublist(0, getListPosition(pos));
    return l.join("").length;
  }

  reloadInput() {
    inputTextController.addListener(_scrollToBottom);
    sharedFunctions.takeInput = takeInput;
    sharedFunctions.deleteInput = deleteInput;
    sharedFunctions.clearInput = clearInput;
    // sharedFunctions.reloadInput = reloadInput;
  }

  void takeInput(String input) {
    setState(() {
      List<String> dummy = List.from(inputList);
      String dis = dummy.join("");
      int pos = inputTextController.selection.baseOffset;
      int p = getListPosition(pos == -1 ? dis.length : pos);
      bool ispow = false;

      for (int i = p - 1; i >= 0; i--) {
        if (dis[i] == Symbols.sup[12]) {
          ispow = true;
          break;
        }
      }

      if (dummy.isEmpty) {
        dummy.insert(0, input);
      } else if (input == "(") {
        if (calculate.isNumber(dummy[p - 1])) {
          dummy.insert(p, Symbols.cross + input);
        } else {
          dummy.insert(p, "(");
        }
      } else if (ispow) {
        if (calculate.isNumber(input)) {
          dummy.remove;
        }
      } else if (dummy[p - 1] == ")") {
        dummy.insert(
            p, calculate.isOperator(input) ? input : Symbols.cross + input);
      } else if (input == Symbols.sup[12] + Symbols.sup[13]) {
        dummy.insert(p, input[0]);
        p++;
        dummy.insert(p, input[1]);
        p++;
        dummy.insert(p, Symbols.cross);
        pos += (pos == -1) ? 4 : 2;
      } else if (input == Symbols.sup[12] + Symbols.sup[2] + Symbols.sup[13]) {
        dummy.insert(p, input[0]);
        p++;
        dummy.insert(p, input[1]);
        p++;
        dummy.insert(p, Symbols.cross);
        pos += (pos == -1) ? 4 : 2;
      } else {
        dummy.insert(p, input);
      }

      dis = dummy.join("");

      if (calculate.isValid(dis)) {
        inputTextController.text = dis;
        inputList = dummy;

        if (pos != -1) {
          inputTextController.selection =
              TextSelection.collapsed(offset: correctPosition(pos + 1));
        }

        String output = calculate.calc(inputTextController.text);
        sharedFunctions.showOutput?.call(output);

        if (output != "") {
          DatabaseManager.instance.addHistory(History(
            exp: dis,
            res: output,
          ));
        }
      }
    });
  }

  void deleteInput() {
    setState(() {
      List<String> dummy = inputList;
      String dis = dummy.join("");
      int pos = inputTextController.selection.baseOffset;
      int p = getListPosition(pos == -1 ? dis.length : pos);

      if (dis.length == 1) {
        dummy = [];
      } else if (pos != 0) {
        dummy.removeAt(p - 1);
      }

      dis = dummy.join("");

      if (calculate.isValid(dis)) {
        inputTextController.text = dis;
        inputList = dummy;
        if (pos != -1) {
          inputTextController.selection =
              TextSelection.collapsed(offset: correctPosition(pos));
        }

        calculate.removeResult();
        String output = calculate.calc(inputTextController.text) ?? "";
        sharedFunctions.showOutput?.call(output);

        if (output != "") {
          DatabaseManager.instance.addHistory(History(
            exp: dis,
            res: output,
          ));
        }
      }
    });
  }

  void clearInput() {
    setState(() {
      inputTextController.text = "";
      inputList = [];
      sharedFunctions.showOutput?.call("");
      calculate.clearResult();
    });
  }

//

  @override
  void initState() {
    super.initState();

    inputTextController.addListener(_scrollToBottom);
    sharedFunctions.takeInput = takeInput;
    sharedFunctions.deleteInput = deleteInput;
    sharedFunctions.clearInput = clearInput;
    sharedFunctions.reloadInput = reloadInput;
  }

  @override
  void dispose() {
    inputTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
//

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.245,
      padding: EdgeInsets.only(left: 20, right: 20, top: 60),
      color: const Color.fromARGB(255, 244, 249, 251),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: TextField(
                readOnly: true,
                showCursor: true,
                textAlign: TextAlign.start,
                cursorColor: const Color.fromARGB(255, 61, 61, 61),
                style: TextStyle(
                  color: const Color.fromARGB(255, 55, 55, 55),
                  fontSize: 35,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: null,
                controller: inputTextController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
