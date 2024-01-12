import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTab = TobetoColor();
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: appBarLogo(brightness: brightness),
          bottom: TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.person_outlined,
              color: colorTab.iconColor,
            )),
            Tab(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.menu_book_sharp,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school_rounded,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.workspace_premium_outlined,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.language,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.translate,
                color: colorTab.iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings_suggest_outlined,
                color: colorTab.iconColor,
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
     
        ]),
      ),
    );
  }
}
