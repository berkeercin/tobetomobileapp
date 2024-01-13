import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/dummydata/profilepage/profile_drop_city.dart';

class CityDropDown extends StatefulWidget {
  const CityDropDown({Key? key}) : super(key: key);

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  String secilenSehir = "Şehir Seçiniz";
  List<String> sehirler = ["Şehir Seçiniz", ...city];
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
      child: DropdownButton<String>(  underline: Container(
          color: Colors.transparent,
        ),
        value: secilenSehir,
        items: sehirler.map<DropdownMenuItem<String>>((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(
              city,
              style: TextStyle(color: tobetoColor.cardColor),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        onChanged: (String? secilenVeri) {
          if (secilenVeri != null) {
            setState(() {
              secilenSehir = secilenVeri;
            });
          }
        },
      ),
    );
  }
}
