import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';

class appBarLogo extends StatelessWidget {
  const appBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Image.asset(
            MyImages().lightThemeLogo,
            width: 150,
          ),
        ),
      ],
    );
  }
}
