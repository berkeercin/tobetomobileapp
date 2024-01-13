import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {Key? key, required this.profileLabelText, required this.myKeyboardType})
      : super(key: key);

  final String profileLabelText;
  final TextInputType myKeyboardType;
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: phoneWidth * 0.9,
      height: phoneHeight * 0.09,
      child: TextFormField(
        keyboardType: myKeyboardType,
        controller: TextEditingController(),
        decoration: InputDecoration(
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
          filled: true,
          labelText: profileLabelText,
          labelStyle: const TextStyle(
            fontSize: 16,
            //color: TobetoColor().logoTextColor,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide:  BorderSide(
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
