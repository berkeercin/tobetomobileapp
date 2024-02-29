import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class ContactTextF extends StatefulWidget {
  const ContactTextF(
      {super.key,
      this.isMultiLine,
      required this.text,
      required this.icon,
      required this.controllerAdd,
      this.containerColor});
  final String text;
  final TextEditingController controllerAdd;
  final Icon icon;
  final bool? isMultiLine;
  final Color? containerColor;

  @override
  State<ContactTextF> createState() => _ContactTextFState();
}

class _ContactTextFState extends State<ContactTextF> {
  @override
  Widget build(BuildContext context) {
    bool isMultiLine = false;
    if (widget.isMultiLine == true) {
      setState(() {
        isMultiLine = true;
      });
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: tobetoColor.iconColor,
            )),
        child: TextField(
          maxLines: isMultiLine ? 3 : null,
          controller: widget.controllerAdd,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.text,
              hintStyle: TextStyle(
                color: TobetoColor().textColorText,
              ),
              icon: Icon(
                widget.icon.icon,
                color: tobetoColor.iconColor,
              )),
        ),
      ),
    );
  }
}
