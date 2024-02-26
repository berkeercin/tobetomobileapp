import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class MyIcons extends StatelessWidget {
  final Color color;
  final Icon icon;
  const MyIcons({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon.icon,
      color: color.withOpacity(0.5),
    );
  }
}

class MyIconsax {
  final usericon = const Icon(Iconsax.user);
  final passwordicon = const Icon(Iconsax.lock4);
  final IconData passVisibilityIcon = Iconsax.eye;
  final IconData passVisibilityOffIcon = Iconsax.eye_slash;
  final emailIcon = Icon(Iconsax.sms);
  final examtimer =
      Icon(size: 25, Iconsax.timer_pause, color: tobetoColor.iconColor);
  final examtick =
      Icon(size: 25, Iconsax.tick_square, color: tobetoColor.iconColor);
  final usericons = Icon(
    size: 30,
    Iconsax.user,
    color: tobetoColor.iconColor,
  );
  final kurumIcon = Icon(
    size: 30,
    Iconsax.dollar_circle,
    color: tobetoColor.iconColor,
  );
  final eduIcon = Icon(
    size: 30,
    Iconsax.teacher,
    color: tobetoColor.iconColor,
  );
  final yetkinlikIcon = Icon(
    size: 30,
    Iconsax.notification_favorite,
    color: tobetoColor.iconColor,
  );
  final certificateIcon = Icon(
    size: 30,
    Iconsax.award,
    color: tobetoColor.iconColor,
  );
  final socialIcon = Icon(
    size: 30,
    Iconsax.instagram,
    color: tobetoColor.iconColor,
  );
  final languIcon = Icon(
    size: 30,
    Iconsax.language_circle,
    color: tobetoColor.iconColor,
  );
  final settingIcon = Icon(
    size: 30,
    Iconsax.setting,
    color: tobetoColor.iconColor,
  );
  final calendar = Icon(
    size: 25,
    Iconsax.calendar_edit,
    color: tobetoColor.iconColor,
  );
}
