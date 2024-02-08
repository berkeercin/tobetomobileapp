import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/basvurularim.dart';

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
    Iconsax.user,
    color: tobetoColor.iconColor,
  );
  final kurumIcon = Icon(
    Iconsax.dollar_circle,
    color: tobetoColor.iconColor,
  );
  final eduIcon = Icon(
    Iconsax.teacher,
    color: tobetoColor.iconColor,
  );
  final yetkinlikIcon = Icon(
    Iconsax.notification_favorite,
    color: tobetoColor.iconColor,
  );
  final certificateIcon = Icon(
    Iconsax.award,
    color: tobetoColor.iconColor,
  );
  final socialIcon = Icon(
    Iconsax.instagram,
    color: tobetoColor.iconColor,
  );
  final languIcon = Icon(
    Iconsax.language_circle,
    color: tobetoColor.iconColor,
  );
  final settingIcon = Icon(
    Iconsax.setting,
    color: tobetoColor.iconColor,
  );
  final calendar = Icon(
    Iconsax.calendar_edit,
    color: tobetoColor.iconColor,
  );
}
