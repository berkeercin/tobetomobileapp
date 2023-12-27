
import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  final Color color;
  final Icon icon;
  MyIcons({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon.icon,
      color: color.withOpacity(0.5),
    );
  }
}

class MyIconsName {
  final userNameIcon = Icon(Icons.person_2_outlined);
  final passwordIcon = Icon(Icons.lock_outline);
  final passVisibilityIcon = Icon(Icons.visibility);
  final passVisibilityOffIcon = Icon(Icons.visibility_off);
}