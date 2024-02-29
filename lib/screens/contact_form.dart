import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';
import 'package:tobetomobileapp/widgets/contact_textfield.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  final iconsax = TobetoIcons();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  late Color textFColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      setState(() {
        assetImage = DarkThemeStyle().darkThemeImage;
        textColor = DarkThemeStyle().darkTextColor;
        backgroundColor = DarkThemeStyle().darkBackgroundColor;
        textFColor = Colors.white;
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = LightThemeStyle().lightThemeImage;
        textColor = LightThemeStyle().lightTextColor;
        backgroundColor = LightThemeStyle().lightBackgroundColor;
        textFColor = TobetoColor().iconColor;
      });
    }
  }

//TO DO : BURAya bak
  @override
  void initState() {
    super.initState();
    brightness = Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: const TobetoAppBarV2(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: TobetoColor().box3EndColor,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "İLETİŞİM FORMU",
                    style: TextStyle(
                      fontSize: 30,
                      color: textColor,
                    ),
                  ),
                ),
                ContactTextF(
                  controllerAdd: nameController,
                  text: "Adınız Soyadınız",
                  icon: const Icon(Iconsax.user),
                ),
                ContactTextF(
                  controllerAdd: emailController,
                  text: "E-Mail",
                  icon: const Icon(Iconsax.direct_right),
                ),
                ContactTextF(
                  controllerAdd: messageController,
                  isMultiLine: true,
                  text: "\nMesajınız",
                  icon: const Icon(Iconsax.message_add),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(mySize / 1.5, 50),
                      backgroundColor: tobetoColor.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context, true);
                    });
                  },
                  child: Text(
                    "Mesaj Bırakın",
                    style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
