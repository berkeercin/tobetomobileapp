import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class CreateTobetoDropdown extends StatefulWidget {
  const CreateTobetoDropdown(
      {super.key,
      required this.title,
      required this.dropdownList,
      required this.onChoose});
  final String title;
  final List<String> dropdownList;
  final Function(List<String>) onChoose;
  @override
  State<CreateTobetoDropdown> createState() => _CreateTobetoDropdownState();
}

class _CreateTobetoDropdownState extends State<CreateTobetoDropdown> {
  late String choosenValue;

  @override
  void initState() {
    super.initState();
    choosenValue = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = [];

    widget.dropdownList.forEach((element) {
      if (!filteredItems.contains(element)) {
        filteredItems.add(element);
      }
    });

    List<String> media = [widget.title, ...filteredItems];
    final tobetoColor = TobetoColor();
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;

    return Container(
      width: phoneWidth * 0.9,
      height: phoneHeight * 0.07,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(style: BorderStyle.solid, color: Colors.black38),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(
          color: Colors.transparent,
        ),
        value: choosenValue,
        items: media.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: tobetoColor.buttonColor),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        onChanged: (String? secilenVeri) {
          if (secilenVeri != null) {
            setState(() {
              choosenValue = secilenVeri;
            });
            widget.onChoose([widget.title, choosenValue]);
          }
        },
      ),
    );
  }
}
