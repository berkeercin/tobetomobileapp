import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';

class EduScreen extends StatefulWidget {
  const EduScreen({Key? key}) : super(key: key);

  @override
  _EduScreenState createState() => _EduScreenState();
}

class _EduScreenState extends State<EduScreen> {
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
    SizedBox sizedBox = const SizedBox(height: 20);
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: AppBarLogo(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            width: 500,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/edu-top.png"),
                    fit: BoxFit.cover)),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text(
                "Eğitimlerim",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          sizedBox,
          TobetoFooter(
            assetImage: assetImage,
            backgroundColor: backgroundColor,
            textColor: textColor,
          )
        ]),
      ),
    );
  }
}
