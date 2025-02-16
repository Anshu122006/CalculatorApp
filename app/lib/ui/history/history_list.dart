import 'package:calculator_app/database/db.dart';
import 'package:calculator_app/services/shared_functions.dart';
import 'package:calculator_app/ui/history/history_class.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});
  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String? selectedValue;
  // List<History> dropdownItems = [];

  void _toggleDropdown() async {
    if (_overlayEntry == null) {
      List<History> dropdownItems =
          await DatabaseManager.instance.getHistoryList();
      _showDropdown(dropdownItems);
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown(List<History> dropdownItems) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    dropdownItems = dropdownItems.reversed.toList();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width * 0.75,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(-241, 52),
          child: Material(
            elevation: 3,
            color: Colors.white,
            child: SizedBox(
              height: height * 0.9,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: dropdownItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dropdownItems[index].exp ?? ""),
                    subtitle: Text("=${dropdownItems[index].res ?? ""}"),
                    trailing: IconButton(
                        onPressed: () async {
                          await DatabaseManager.instance
                              .deleteHistory(dropdownItems[index].id!);
                          List<History> h =
                              await DatabaseManager.instance.getHistoryList();

                          setState(() {
                            _removeDropdown();
                            _showDropdown(h);
                          });
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();
    SharedFunctions.instance.closeHistoryList ??= _removeDropdown;
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        onPressed: _toggleDropdown,
        icon: Icon(
          Icons.list_alt,
          color: Colors.amber[50],
          size: 30,
        ),
      ),
    );
  }
}
