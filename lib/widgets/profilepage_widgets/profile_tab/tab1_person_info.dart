import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_date.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_citydropdown.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_image.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_textField.dart';

class ProfileTabPersonalInfo extends StatelessWidget {
  const ProfileTabPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImage(),
            const ProfileTextField(
              profileLabelText: "Adınız*",
              myKeyboardType: TextInputType.name,
            ),
            const ProfileTextField(
                profileLabelText: "Soyadınız*",
                myKeyboardType: TextInputType.name),
            const ProfileTextField(
                profileLabelText: "Telefon Numaranız*",
                myKeyboardType: TextInputType.phone),
            const ProfileDate(),
            const SizedBox(
              height: 15,
            ),
            const ProfileTextField(
                profileLabelText: "TC Kimlik No*",
                myKeyboardType: TextInputType.number),
            const SizedBox(
              height: 30,
              child: Text(
                "*Aboneliklerde fatura için doldurulması zorunlu alan*",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
            const ProfileTextField(
                profileLabelText: "E-posta",
                myKeyboardType: TextInputType.emailAddress),
            const ProfileTextField(
                profileLabelText: "Ülke", myKeyboardType: TextInputType.text),
            Text(
              "İl*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const CityDropDown(),
            Text(
              "İlçe*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const ProfileTextField(
                profileLabelText: "İlçe Yazınız...",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Mahalle / Sokak",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Hakkımda",
                myKeyboardType: TextInputType.text),
            const SizedBox(
              height: 5,
            ),
            const ProfileSaveButton(butonName: "Kaydet"),
          ],
        ),
      ),
    );
  }
}
