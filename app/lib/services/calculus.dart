import 'dart:convert';
import 'package:http/http.dart' as http;

class Calculus {
  static String wolframApiKey = "LPEL3Y-Y7VU5ERHXK";
  static String baseUrl = "https://api.wolframalpha.com/v2/query";

  static Future calculateIntegral(String expression, String type) async {
    final String url;
    switch (type) {
      case "derivative":
        url =
            "$baseUrl?input=d/dx(${Uri.encodeComponent(expression)})&format=plaintext&output=JSON&appid=$wolframApiKey";
        break;
      case "solve":
        url =
            "$baseUrl?input=solve(${Uri.encodeComponent(expression)})&format=plaintext&output=JSON&appid=$wolframApiKey";
        break;
      default:
        url =
            "$baseUrl?input=integrate+(${Uri.encodeComponent(expression)})&format=plaintext&output=JSON&appid=$wolframApiKey";
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var pods = data["queryresult"]["pods"];
      var res = "";

      switch (type) {
        case "derivative":
          res = pods[0]["subpods"][0]["plaintext"];
          break;
        case "solve":
          res = pods[1]["subpods"][0]["plaintext"];
          break;
        default:
          res = pods[0]["subpods"][0]["plaintext"];
          res = res.substring(8);
      }

      if (res == "") {
        res = "Integral not found";
      }
      return res.toString();
    } else {
      return "Error: ${response.statusCode}";
    }
  }
}
