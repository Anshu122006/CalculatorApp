# CalculatorApp (Android)
The libs app/libs folder contains the code for the app,

language -> dart, <br>
framework -> flutter, <br>
database -> sqlite, <br>
api used -> wolframalpha api <br>

dependencies used: <br>
 -flutter:
   - sdk: flutter
 - http: ^1.3.0
 - sqflite: any
 - path_provider: any
 - path: any
 - intl: ^0.20.2

Dependencies can be checked in the pubspec.ymal file too.

Key features of the app:
- In normal mode, it calculates and stores the result dynamically
- Keeps a history of the calculations
- Can calculate integrals, derivatives and can solve equations (through the api)
- auto-checks for a valid input, ie, user cannot enter an invalid input

An apk of the app is also present for testing.
