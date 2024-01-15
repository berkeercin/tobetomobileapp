import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class ProfileCheckBox extends StatefulWidget {
  const ProfileCheckBox({super.key, required this.chechboxText});
  final String chechboxText;

  @override
  State<ProfileCheckBox> createState() => _ProfileCheckBoxState();
}

class _ProfileCheckBoxState extends State<ProfileCheckBox> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            activeColor: TobetoColor().cardColor,
            tristate: false,
            onChanged: (newbool) {
              setState(() {
                isChecked = newbool;
              });
            }),
        Text(widget.chechboxText),
      ],
    );
  }
}
