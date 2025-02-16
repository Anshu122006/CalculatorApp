import 'package:calculator_app/ui/calculus/keypad.dart';
import 'package:calculator_app/ui/calculus/input.dart';
import 'package:calculator_app/ui/calculus/output.dart';
import 'package:calculator_app/ui/history/history_list.dart';
import 'package:flutter/material.dart';

class CalculusCalc extends StatelessWidget {
  const CalculusCalc({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          leading: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white))),
          leadingWidth: width,
          toolbarHeight: height * 0.07,
          backgroundColor: const Color.fromARGB(255, 45, 45, 45),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [HistoryList()],
            )
          ],
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(flex: 2, child: InputDisplay()),
              Expanded(flex: 2, child: OutputDisplay()),
              Expanded(flex: 6, child: Keypad()),
            ],
          ),
        ));
  }
}
