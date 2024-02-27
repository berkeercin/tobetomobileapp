import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profilepage_button.dart';
import 'package:tobetomobileapp/widgets/edit_profile_screen_widgets/profilepage_textfield.dart';

class ProfileTabSettings extends StatelessWidget {
  const ProfileTabSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileTextField(
                profileLabelText: "Eski Şifre*",
                myKeyboardType: TextInputType.visiblePassword),
            ProfileTextField(
                profileLabelText: "Yeni Şifre*",
                myKeyboardType: TextInputType.visiblePassword),
            ProfileTextField(
                profileLabelText: "Yeni Şifre Tekrar*",
                myKeyboardType: TextInputType.visiblePassword),
            SizedBox(
              height: 5,
            ),
            ProfileSaveButton(butonName: "Şifre Değiştir"),
            ProfileSaveButton(
              butonName: "Kaydet",
            ),
          ],
        ),
      ),
    );
  }
}
