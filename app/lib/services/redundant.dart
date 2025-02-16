//-----------------------------------StackClass-----------------------------------
// class Stack {
//   List<String> _items = [];

//   void push(String item) {
//     _items.add(item);
//   }

//   void pop() {
//     if (_items.isNotEmpty) _items.removeLast();
//   }

//   String top() {
//     return _items.isNotEmpty ? _items[_items.length - 1] : "";
//   }

//   bool empty() {
//     return !_items.isNotEmpty;
//   }

//   copy(Stack stack) {
//     _items = List.from(stack._items);
//   }
// }

//

  // final Stack _operatorStack = Stack();
  // final Stack _operandStack = Stack();
  // final Map<String, int> _priority = {
  //   "+": 1,
  //   "-": 1,
  //   "*": 2,
  //   "%": 2,
  //   "/": 2,
  //   "=": 3,
  // };
  // final Map<String, int> _type = {"+": 2, "-": 2, "*": 2, "/": 2, "%": 2};

//

//   initTestInput() {
//     // _calc();
//   }

//   test() {
//     _calc("8*(5*(6");
//   }

// //

//   String _convertIfNeeded(String s) {
//     if (s == "×") {
//       s = "*";
//     } else if (s == "÷") {
//       s = "/";
//     }

//     return s;
//   }

  // bool isOperator(String s) {
  //   s = _convertIfNeeded(s);
  //   bool isOp = false;
  //   _priority.forEach((key, value) {
  //     if (key == s) {
  //       isOp = true;
  //     }
  //   });

  //   return isOp;
  // }

  // int _priorityof(String s) {
  //   s = _convertIfNeeded(s);
  //   return _priority[s] ?? -1;
  // }

  // int _typeof(String s) {
  //   s = _convertIfNeeded(s);
  //   return _type[s] ?? 0;
  // }

  // perform(String opd1, String opd2, String op) {
  //   double a = double.parse(opd1);
  //   double b = double.parse(opd2);
  //   op = _convertIfNeeded(op);

  //   switch (op) {
  //     case "+":
  //       return (a + b).toString();
  //     case "-":
  //       return (a - b).toString();
  //     case "*":
  //       return (a * b).toString();
  //     case "/":
  //       return (a / b).toString();
  //     case "%":
  //       return (a % b).toString();
  //   }
  // }

//

  // calc(String expression) {
  //   if (expression != "") {
  //     String s = expression[expression.length - 1];
  //     if (!isOperator(s)) {
  //       return _calc(expression);
  //     } else {
  //       return _calc(expression.substring(0, expression.length - 1));
  //     }
  //   } else {
  //     return "";
  //   }
  // }










  // String output = calculate.calc(inputTextController.text);
      // sharedFunctions.showOutput?.call(output);
      // } else if (input == "( )") {
      //   if (s == "") {
      //     s = "(";
      //   } else if (pos == -1) {
      //     if (openBrackets(s) == 0) {
      //       s += (calculate.isOperator(s[s.length - 1]) ||
      //               s[s.length - 1] == "(")
      //           ? "("
      //           : "×(";
      //     } else {
      //       s += (calculate.isOperator(s[s.length - 1]) ||
      //               s[s.length - 1] == "(")
      //           ? "("
      //           : ")";
      //     }
      //   } else {
      //     String b = "";
      //     if (pos != 0 && openBrackets(s.substring(0, pos)) == 0) {
      //       b = (calculate.isOperator(s[pos - 1]) || s[s.length - 1] == "(")
      //           ? "("
      //           : "×(";
      //     } else {
      //       b = (calculate.isOperator(s[pos - 1]) || s[s.length - 1] == "(")
      //           ? "("
      //           : ")";
      //     }
      //     s = s.substring(0, pos) +
      //         b +
      //         (pos == s.length ? "" : s.substring(pos));
      //     i = b.length;
      //   }
      // }

      // if (calculate.isValid(s, pos != -1 ? pos + i : s.length)) {
      //   inputTextController.text = s;
      //   if (pos != -1) {
      //     inputTextController.selection =
      //         TextSelection.collapsed(offset: pos + i);
      //   }

      // String output = calculate.calc(inputTextController.text);
      // sharedFunctions.showOutput?.call(output);
      // }