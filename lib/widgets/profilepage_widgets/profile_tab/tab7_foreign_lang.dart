import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_lang_score_drop.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_language.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';

class ProfileTabForeignLang extends StatelessWidget {
  const ProfileTabForeignLang({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
   padding: TobetoSize().profilePadding,        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LanguageDropDown(),
            LanguageScoreDropDown(),
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
