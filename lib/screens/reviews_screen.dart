import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
    final double phoneWidth = MediaQuery.of(context).size.width;

    final colorTab = TobetoColor();
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: appBarLogo(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            widthFactor: phoneWidth,
            child: RichText(
              text: TextSpan(
                text: "Yetkinliklerini ",
                style: TextStyle(color: colorTab.logoTextColor, fontSize: 25),
                children: <TextSpan>[
                  TextSpan(
                    text: " ücretsiz ölç,\n",
                    style: TextStyle(color: textColor),
                  ),
                  TextSpan(
                    text: "bilgilerini ",
                    style: TextStyle(color: colorTab.logoTextColor),
                  ),
                  TextSpan(
                    text: " test et.\n",
                    style: TextStyle(color: textColor),
                  )
                ],
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
