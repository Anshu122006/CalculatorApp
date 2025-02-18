import 'package:calculator_app/ui/history/history_list.dart';
import 'package:calculator_app/ui/normal/keypad.dart';
import 'package:calculator_app/ui/normal/input.dart';
import 'package:calculator_app/ui/normal/output.dart';
import 'package:flutter/material.dart';

class NormalCalc extends StatelessWidget {
  const NormalCalc({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
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
              Expanded(flex: 1, child: OutputDisplay()),
              Expanded(flex: 4, child: Keypad()),

            ],
          ),
        ));
  }
}
