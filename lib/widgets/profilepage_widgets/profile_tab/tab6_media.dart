import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_social_dropdown.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_textField.dart';

class ProfileTabMedia extends StatelessWidget {
  const ProfileTabMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SocialDropDown(),
            ProfileTextField(
                profileLabelText: "https://",
                myKeyboardType: TextInputType.url),
            SizedBox(
              height: 5,
            ),
            ProfileSaveButton(butonName: "Kaydet"),
          ],
        ),
      ),
    );
  }
}
