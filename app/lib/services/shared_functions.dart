// to ennableto distinct widgets to call specific functions inside each other

class SharedFunctions {
  static final SharedFunctions _instance = SharedFunctions._();
  SharedFunctions._();

  static SharedFunctions get instance => _instance;

  Function(String)? takeInput;
  Function()? deleteInput;
  Function()? clearInput;
  Function()? getOutput;
  Function(String)? showOutput;
  Function()? reloadInput;
  Function()? reloadOutput;
  Function()? closeHistoryList;
}
