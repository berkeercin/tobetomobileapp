import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';

class ProfileSaveButton extends StatefulWidget {
  const ProfileSaveButton({super.key, required this.butonName});
  final String butonName;
  
  @override
  State<ProfileSaveButton> createState() => _ProfileSaveButtonState();
}

class _ProfileSaveButtonState extends State<ProfileSaveButton> {
  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: phoneWidth,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(TobetoColor().cardColor),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context, true);
            });
          },
          child: Text(
            widget.butonName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
