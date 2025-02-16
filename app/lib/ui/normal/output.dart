import 'package:calculator_app/services/shared_functions.dart';
import 'package:flutter/material.dart';

//-----------------------------------OutputDisplay-----------------------------------
class OutputDisplay extends StatefulWidget {
  const OutputDisplay({super.key});

  @override
  State<OutputDisplay> createState() => _OutputDisplayState();
}

class _OutputDisplayState extends State<OutputDisplay> {
  String outputText = "";

  showOutput(String output) {
    setState(() {
      outputText = output;
    });
  }

  reloadOutput() {
    SharedFunctions.instance.showOutput = showOutput;
    // sharedFunctions.reloadInput = reloadInput;
  }

  @override
  void initState() {
    super.initState();

    SharedFunctions.instance.showOutput = showOutput;
    SharedFunctions.instance.reloadOutput = reloadOutput;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.1,
      padding: EdgeInsets.all(25),
      color: const Color.fromARGB(255, 244, 249, 251),
      child: SingleChildScrollView(
        child: Text(
          outputText,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: const Color.fromARGB(255, 50, 50, 50),
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
