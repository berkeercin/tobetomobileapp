import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';

class appBarLogo extends StatelessWidget {
  const appBarLogo({super.key, required this.brightness});
  final Brightness brightness;
  @override
  Widget build(BuildContext context) {
    late String logo;
    MyImages myImages = MyImages();
    if (brightness == Brightness.dark) {
      logo = myImages.darkThemeLogo;
    } else {
      logo = myImages.lightThemeLogo;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Image.asset(
            logo,
            width: 150,
          ),
        ),
      ],
    );
  }
}
