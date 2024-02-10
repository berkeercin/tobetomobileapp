import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class ContactTextF extends StatelessWidget {
  ContactTextF(
      {super.key,
      required this.text,
      required this.icon,
      required this.controllerAdd});
  final String text;
  final TextEditingController controllerAdd;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controllerAdd,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: Colors.brown, style: BorderStyle.solid, width: 2),
            ),
            iconColor: TobetoColor().box3EndColor,
            hintText: text,
            hintStyle: TextStyle(color: TobetoColor().textColorText),
            icon: Icon(
              icon.icon,
              color: TobetoColor().box3EndColor,
            )),
      ),
    );
  }
}
