import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/dummydata/profilepage/language.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  String secilenDil = "Dil Seçiniz";
  List<String> dil = ["Dil Seçiniz", ...language];
  final tobetoColor = TobetoColor();

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Container(
      width: phoneWidth * 0.9,
      height: phoneHeight * 0.07,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(style: BorderStyle.solid, color: Colors.black38)),
      child: DropdownButton<String>(
        underline: Container(
          color: Colors.transparent,
        ),
        value: secilenDil,
        items: dil.map<DropdownMenuItem<String>>((String beceri) {
          return DropdownMenuItem<String>(
            value: beceri,
            child: Text(
              beceri,
              style: TextStyle(color: tobetoColor.cardColor),
            ),
          );
        }).toList(),
        icon: Icon(Icons.arrow_drop_down_circle_outlined),
        onChanged: (String? secilenVeri) {
          if (secilenVeri != null) {
            setState(() {
              secilenDil = secilenVeri;
            });
          }
        },
      ),
    );
  }
}
