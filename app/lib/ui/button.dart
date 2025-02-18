import 'package:calculator_app/ui/calculus/main_ui.dart';
import 'package:calculator_app/ui/symbols.dart';
import 'package:calculator_app/services/shared_functions.dart';
import 'package:flutter/material.dart';

//-----------------------------------Button-----------------------------------
class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final double fontSize;
  final double padding;
  final double scale;
  final FontWeight fontWeight;

  const Button({
    super.key,
    required this.text,
    this.textColor = const Color.fromARGB(255, 255, 255, 255),
    this.bgColor = const Color.fromARGB(255, 50, 50, 50),
    this.fontSize = 22,
    this.padding = 6,
    this.scale = 1.1,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: scale,
        child: ElevatedButton(
            onPressed: () {
              switch (text) {
                case "CALC":
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    SharedFunctions.instance.closeHistoryList?.call();
                    return CalculusCalc();
                  })).then((value) => {
                        if (value == true)
                          {
                            SharedFunctions.instance.reloadInput?.call(),
                            SharedFunctions.instance.reloadOutput?.call(),
                          }
                      });
                  break;
                case "eval":
                  SharedFunctions.instance.getOutput?.call();
                  break;
                case "AC":
                  SharedFunctions.instance.clearInput?.call();
                  break;
                case Symbols.backspace:
                  SharedFunctions.instance.deleteInput?.call();
                case "sin":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "cos":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "tan":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "cot":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "sec":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "cosec":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "ln":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "^":
                  SharedFunctions.instance.takeInput?.call("$text(");
                  break;
                case "${Symbols.sqrt}x":
                  SharedFunctions.instance.takeInput?.call("${Symbols.sqrt}(");
                  break;
                case "x⁻¹":
                  SharedFunctions.instance.takeInput
                      ?.call(Symbols.sup[10] + Symbols.sup[1] + Symbols.cross);
                  break;
                case Symbols.tick:
                  break;
                case "    ":
                  break;
                default:
                  SharedFunctions.instance.takeInput?.call(text);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(padding),
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor, fontWeight: fontWeight, fontSize: fontSize),
            )));
  }
}
