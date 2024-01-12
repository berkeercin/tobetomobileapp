import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,

        radius: 50, // Dairenin yarıçapı
        backgroundImage:
            AssetImage('assets/images/profile_photo.png'), // Profil resmi
      ),
    );
  }
}
