import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
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
  void initState() {
    super.initState();
    brightness = Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
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
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            tobetoColor.buttonColor),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, true);
                        });
                      },
                      child: Text(
                        "Mesaj Bırakın",
                        style: TextStyle(
                            fontSize: 18,
                            color: backgroundColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
