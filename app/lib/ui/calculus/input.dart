import 'package:calculator_app/database/db.dart';
import 'package:calculator_app/services/calculus.dart';
import 'package:calculator_app/services/shared_functions.dart';
import 'package:calculator_app/ui/calculus/dropdown.dart';
import 'package:calculator_app/ui/history/history_class.dart';
import 'package:flutter/material.dart';

//-----------------------------------InputDisplay-----------------------------------
class InputDisplay extends StatefulWidget {
  const InputDisplay({super.key});

  @override
  State<InputDisplay> createState() => InputDisplayState();
}

class InputDisplayState extends State<InputDisplay> {
  TextEditingController inputTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final SharedFunctions sharedFunctions = SharedFunctions.instance;

  // ignore: unused_field
  String _selectedValue = "integral";

  List<String> inputList = [];

  onValueChange(String s) {
    setState(() {
      _selectedValue = s;
    });
  }

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

//

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

  getOutput() async {
    setState(() {
      sharedFunctions.showOutput?.call("Evaluating...");
    });
    String? res = await Calculus.calculateIntegral(
        inputTextController.text, _selectedValue);
    DatabaseManager.instance
        .addHistory(History(exp: inputTextController.text, res: res));

    setState(() {
      sharedFunctions.showOutput?.call(res ?? "");
    });
  }

  takeInput(String input) {
    setState(() {
      List<String> dummy = List.from(inputList);
      String dis = dummy.join("");
      int pos = inputTextController.selection.baseOffset;
      int p = getListPosition(pos == -1 ? dis.length : pos);

      if (dummy.isEmpty) {
        dummy.insert(0, input);
      } else {
        dummy.insert(p, input);
      }

      dis = dummy.join("");

      inputTextController.text = dis;
      inputList = dummy;

      if (pos != -1) {
        inputTextController.selection =
            TextSelection.collapsed(offset: correctPosition(pos + 1));
      }
    });
  }

  deleteInput() {
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

      inputTextController.text = dis;
      inputList = dummy;
      if (pos != -1) {
        inputTextController.selection =
            TextSelection.collapsed(offset: correctPosition(pos));
      }
    });
  }

  clearInput() {
    setState(() {
      inputTextController.text = "";
      inputList = [];
    });
  }

  @override
  void initState() {
    super.initState();

    inputTextController.addListener(_scrollToBottom);
    sharedFunctions.takeInput = takeInput;
    sharedFunctions.deleteInput = deleteInput;
    sharedFunctions.clearInput = clearInput;
    sharedFunctions.getOutput = getOutput;
  }

  @override
  void dispose() {
    inputTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.245,
      padding: EdgeInsets.only(left: 20, right: 5, top: 5),
      color: const Color.fromARGB(255, 244, 249, 251),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ExpTypeDropdown(
                selectedValue: _selectedValue, onValueChanged: onValueChange),
          ),
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
