import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';

class ProfileSaveButton extends StatefulWidget {
  const ProfileSaveButton({super.key, required this.butonName});
  final String butonName;

  @override
  State<ProfileSaveButton> createState() => _ProfileSaveButtonState();
}

class _ProfileSaveButtonState extends State<ProfileSaveButton> {
  late String assetImage;
  late Color textColor;
  late Color textFColor;
  late Color backgroundColor;
  void darkLightTheme(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) {
      setState(() {
        assetImage = DarkThemeStyle().darkThemeImage;
        textColor = DarkThemeStyle().darkTextColor;
        backgroundColor = DarkThemeStyle().darkBackgroundColor;
        textFColor = Colors.white;
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = LightThemeStyle().lightThemeImage;
        textColor = LightThemeStyle().lightTextColor;
        backgroundColor = LightThemeStyle().lightBackgroundColor;
        textFColor = TobetoColor().iconColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    darkLightTheme(context);
    final double phoneWidth = MediaQuery.of(context).size.width;
    final mySize = MediaQuery.of(context).size.width;
    var color = TobetoColor();

    return Center(
      child: SizedBox(
          width: phoneWidth,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(color.buttonColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  minimumSize: MaterialStatePropertyAll(Size(mySize, 50))),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                widget.butonName,
                style: TextStyle(color: backgroundColor, fontSize: 16),
              ))),
    );
  }
}
