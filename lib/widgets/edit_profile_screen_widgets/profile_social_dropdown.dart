import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/dummydata/profilepage/socialmedia.dart';

class SocialDropDown extends StatefulWidget {
  const SocialDropDown({Key? key}) : super(key: key);

  @override
  State<SocialDropDown> createState() => _SocialDropDownState();
}

class _SocialDropDownState extends State<SocialDropDown> {
  String secilenMedia = "Sosyal Medya Seçiniz";
  List<String> media = ["Sosyal Medya Seçiniz", ...socialMedia];
  final tobetoColor = TobetoColor();

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Container(
      width: phoneWidth * 0.9,
      height: phoneHeight * 0.07,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(style: BorderStyle.solid, color: Colors.black38)),
      child: DropdownButton<String>(
        underline: Container(
          color: Colors.transparent,
        ),
        value: secilenMedia,
        items: media.map<DropdownMenuItem<String>>((String media1) {
          return DropdownMenuItem<String>(
            value: media1,
            child: Text(
              media1,
              style: TextStyle(color: tobetoColor.cardColor),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        onChanged: (String? secilenVeri) {
          if (secilenVeri != null) {
            setState(() {
              secilenMedia = secilenVeri;
            });
          }
        },
      ),
    );
  }
}
