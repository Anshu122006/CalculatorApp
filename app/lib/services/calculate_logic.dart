// ignore_for_file: avoid_print
import 'package:calculator_app/ui/symbols.dart';
import 'package:math_expressions/math_expressions.dart';

//-----------------------------------CalculateClass-----------------------------------

class Calculate {
  static final Calculate _instance = Calculate._();
  Calculate._();

  static Calculate get instance => _instance;

  //

  final List operators = ["+", "-", "*", "/", "%", "^"];
  final String numbers = "0123456789pe";
  final Parser _parser = Parser();
  List<String> resultList = [];
  Expression? _expression;

  bool isOperator(String s) {
    for (int i = 0; i < operators.length; i++) {
      if (s == operators[i]) {
        return true;
      }
    }
    return false;
  }

  bool isNumber(String s) {
    for (int i = 0; i < numbers.length; i++) {
      if (s == numbers[i]) {
        return true;
      }
    }
    return false;
  }

  bool isValid(String s) {
    s = formatExpression(s);

    if (s == "") {
      return true;
    }
    if (s.length == 1 && (isOperator(s[0]) || s[0] == ")")) {
      return false;
    }
    if (s[0] == "^") {
      return false;
    }

    int p = 0;
    if (s.length > 1) {
      for (int i = 0; i < s.length - 1; i++) {
        if (isOperator(s[i]) && isOperator(s[i + 1])) {
          return false;
        }
        if (s[i] == "(") {
          p++;
        } else if (s[i] == ")") {
          p--;
          if (p < 0) {
            return false;
          }
        }
      }
      if (s[s.length - 1] == ")") {
        p--;
        if (p < 0) {
          return false;
        }
      }
    }

    return true;
  }

  formatExpression(String exp) {
    int openBrackets = 0;
    String newExp = "";

    for (int i = 0; i < exp.length; i++) {
      if (exp[i] == "(") {
        openBrackets++;
      } else if (exp[i] == ")") {
        openBrackets--;
      }
      if (exp[i] == Symbols.cross) {
        newExp += "*";
      } else if (exp[i] == Symbols.div) {
        newExp += "/";
      } else if (exp[i] == Symbols.pi) {
        newExp += "p";
      } else if (exp[i] == "e") {
        newExp += "E";
      } else if (exp[i] == Symbols.sqrt) {
        newExp += "sqrt";
      } else if (exp[i] == Symbols.sup[10]) {
        newExp += "^(-1)";
        i++;
      } else {
        newExp += exp[i];
      }
    }

    if (newExp.isNotEmpty && isOperator(newExp[newExp.length - 1])) {
      newExp = newExp.length == 1 ? "" : newExp.substring(0, newExp.length - 1);
    }
    for (int i = 0; i < openBrackets; i++) {
      newExp += ")";
    }

    print(newExp);

    return newExp;
  }

  calc(String exp) {
    ContextModel cm = ContextModel();
    cm.bindVariable(Variable("p"), Number(3.141592653589793));
    cm.bindVariable(Variable("E"), Number(2.718281828459045));
    if (exp.isEmpty) {
      resultList = [];
      resultList.add("");
    } else {
      exp = formatExpression(exp);
      try {
        _expression = _parser.parse(exp);
        String? res = _expression?.evaluate(EvaluationType.REAL, cm).toString();
        resultList.add(res!);
      } catch (e) {
        //
      }

      int l = resultList.isNotEmpty ? resultList.length - 1 : 0;

      if (resultList.isEmpty) {
        resultList.add("");
      }
      // print(resultList[l]);
      return resultList[l];
    }
  }

  removeResult() {
    if (resultList.isNotEmpty) {
      resultList.removeLast();
    }
  }

  clearResult() {
    resultList = [];
  }
}
