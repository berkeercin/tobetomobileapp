import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_chechbox.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_date.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_citydropdown.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_textField.dart';

class ProfileTabExperiences extends StatelessWidget {
  const ProfileTabExperiences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileTextField(
                profileLabelText: "Kurum Adı*",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Pozisyon*",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Sektör*",
                myKeyboardType: TextInputType.text),
            Text(
              "Şehir Seçiniz*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const CityDropDown(),
            Text(
              "İş Başlangıcı*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const ProfileDate(),
            const SizedBox(
              height: 15,
            ),
            Text(
              "İş Bitiş*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const ProfileDate(),
            const SizedBox(
              height: 10,
            ),
            const ProfileCheckBox(chechboxText: "Çalışmaya Devam Ediyorum"),
            const ProfileTextField(
                profileLabelText: "İş Açıklaması",
                myKeyboardType: TextInputType.text),
            const SizedBox(
              height: 5,
            ),
            const ProfileSaveButton(butonName: "Kaydet"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
