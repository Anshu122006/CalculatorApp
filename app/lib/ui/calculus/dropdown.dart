import 'package:flutter/material.dart';

//-----------------------------------ExpTypeDropdown-----------------------------------
class ExpTypeDropdown extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onValueChanged;

  ExpTypeDropdown(
      {super.key, required this.selectedValue, required this.onValueChanged});

  final List<String> items = ["integral", "derivative", "solve"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 42,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 67, 67, 67),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: DropdownButton<String>(
        dropdownColor: const Color.fromARGB(255, 67, 67, 67),
        underline: Container(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: const Color.fromARGB(255, 220, 220, 220),
        ),
        style: TextStyle(
            color: const Color.fromARGB(255, 187, 187, 187),
            fontWeight: FontWeight.bold),
        value: selectedValue,
        onChanged: (String? newValue) {
          if (newValue != null) {
            onValueChanged(newValue);
          }
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Center(
              child: Text(
                item,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
