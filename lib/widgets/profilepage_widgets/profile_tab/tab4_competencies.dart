import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profile_yetkin_dropdown.dart';
import 'package:tobetomobileapp/widgets/profilepage_widgets/profilepage_button.dart';

class ProfileTabCompetencies extends StatelessWidget {
  const ProfileTabCompetencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yetkinlik",
              style: TextStyle(
                fontSize: 16,
                color: TobetoColor().logoTextColor,
              ),
            ),
            const YetkinlikDropDown(),
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
