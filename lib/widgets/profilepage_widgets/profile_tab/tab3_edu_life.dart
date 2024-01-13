import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_chechbox.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_date.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_textField.dart';

class ProfileTabEduLife extends StatelessWidget {
  const ProfileTabEduLife({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileTextField(
                profileLabelText: "Eğitim Durumu*",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Üniversite*",
                myKeyboardType: TextInputType.text),
            const ProfileTextField(
                profileLabelText: "Bölüm*", myKeyboardType: TextInputType.text),
            Text(
              "Başlangıç Yılı*",
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
              "Mezuniyet Yılı*",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const ProfileDate(),
            const ProfileCheckBox(chechboxText: "Devam Ediyorum"),
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
