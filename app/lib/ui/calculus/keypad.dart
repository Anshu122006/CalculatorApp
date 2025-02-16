import 'package:calculator_app/ui/button.dart';
import 'package:calculator_app/ui/symbols.dart';
import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 99, 99, 99),
      child: Column(
        children: [
          Row1(),
          Row2(),
          Row3(),
          Row4(),
          Row5(),
          Row6(),
          Row7(),
        ],
      ),
    );
  }
}

//-----------------------------------Row1-----------------------------------
class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 43, 43, 43);
    double fontSize = 15;
    double padding = 0;
    double scale = 0.9;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height * 0.06,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
                text: "SHIFT",
                textColor: textolor,
                bgColor: Colors.green,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            // Button(
            //     text: "NORM",
            //     textColor: textolor,
            //     bgColor: const Color.fromARGB(255, 255, 134, 42),
            //     padding: padding,
            //     scale: scale,
            //     fontSize: fontSize),
            SizedBox(width: 190),
            Button(
                text: Symbols.backspace,
                textColor: textolor,
                bgColor: Colors.amber,
                padding: padding,
                scale: scale,
                fontSize: fontSize * 1.5),
            Button(
                text: "AC",
                textColor: textolor,
                bgColor: Colors.amber,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
          ],
        ),
      ),
    );
  }
}

class Row2 extends StatelessWidget {
  const Row2({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 43, 43, 43);
    Color btnColor = const Color.fromARGB(255, 224, 224, 224);
    double fontSize = 15;
    double padding = 0;
    double scale = 0.9;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height * 0.06,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
                text: "sin",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "cos",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "tan",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "cot",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "sec",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "cosec",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------Row3-----------------------------------
class Row3 extends StatelessWidget {
  const Row3({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 43, 43, 43);
    Color btnColor = const Color.fromARGB(255, 224, 224, 224);
    double fontSize = 15;
    double padding = 0;
    double scale = 0.9;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height * 0.06,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
                text: "    ",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "    ",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize * 1.5),
            Button(
                text: "x",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: Symbols.pi,
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "e",
                // text: "log${Symbols.sub[1] + Symbols.sub[0]}",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
            Button(
                text: "ln",
                textColor: textolor,
                bgColor: btnColor,
                padding: padding,
                scale: scale,
                fontSize: fontSize),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------Row4-----------------------------------
class Row4 extends StatelessWidget {
  const Row4({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 255, 255, 255);
    Color btnColor = const Color.fromARGB(255, 50, 50, 50);

    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(text: "7", textColor: textolor, bgColor: btnColor),
          Button(text: "8", textColor: textolor, bgColor: btnColor),
          Button(text: "9", textColor: textolor, bgColor: btnColor),
          Button(
              text: "(",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
          Button(
              text: ")",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
        ],
      ),
    );
  }
}

//-----------------------------------Row5-----------------------------------
class Row5 extends StatelessWidget {
  const Row5({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 255, 255, 255);
    Color btnColor = const Color.fromARGB(255, 50, 50, 50);

    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      color: const Color.fromARGB(255, 99, 99, 99),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(text: "4", textColor: textolor, bgColor: btnColor),
          Button(text: "5", textColor: textolor, bgColor: btnColor),
          Button(text: "6", textColor: textolor, bgColor: btnColor),
          Button(
              text: "*",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
          Button(
              text: "/",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
        ],
      ),
    );
  }
}

//-----------------------------------Row6-----------------------------------
class Row6 extends StatelessWidget {
  const Row6({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 255, 255, 255);
    Color btnColor = const Color.fromARGB(255, 50, 50, 50);

    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      color: const Color.fromARGB(255, 99, 99, 99),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(text: "1", textColor: textolor, bgColor: btnColor),
          Button(text: "2", textColor: textolor, bgColor: btnColor),
          Button(text: "3", textColor: textolor, bgColor: btnColor),
          Button(
              text: "+",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
          Button(
              text: "-",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
        ],
      ),
    );
  }
}

//-----------------------------------Row7-----------------------------------
class Row7 extends StatelessWidget {
  const Row7({super.key});

  @override
  Widget build(BuildContext context) {
    Color textolor = const Color.fromARGB(255, 255, 255, 255);
    Color btnColor = const Color.fromARGB(255, 50, 50, 50);

    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      color: const Color.fromARGB(255, 99, 99, 99),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(text: "0", textColor: textolor, bgColor: btnColor),
          Button(text: ".", textColor: textolor, bgColor: btnColor),
          Button(text: "^", textColor: textolor, bgColor: btnColor),
          Button(
              text: "=",
              textColor: textolor,
              bgColor: const Color.fromARGB(255, 155, 155, 155)),
          Button(text: "eval", textColor: textolor, bgColor: btnColor)
        ],
      ),
    );
  }
}
