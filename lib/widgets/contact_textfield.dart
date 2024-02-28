import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class ContactTextF extends StatelessWidget {
  const ContactTextF(
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
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1.5,
              style: BorderStyle.solid,
              color: tobetoColor.iconColor,
            )),
        child: TextField(
          controller: controllerAdd,
          decoration: InputDecoration(
              border: InputBorder.none,
              iconColor: TobetoColor().box3EndColor,
              hintText: text,
              hintStyle: TextStyle(color: TobetoColor().textColorText),
              icon: Icon(
                icon.icon,
                color: TobetoColor().box3EndColor,
              )),
        ),
      ),
    );
  }
}
