// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String assetImage;
  late Brightness brightness;
  late Color textFColor;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  late String istanbulKodluyorImage;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    darkLightTheme(context);
  }

  final mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/reset_screen.png"),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Parolanızı sıfırlamak için lütfen kayıtlı\ne-posta adresinizi girin.",
                  style: TextStyle(color: textFColor, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2.5,
                        style: BorderStyle.solid,
                        color: textFColor,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: TextField(
                      controller: mailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Iconsax.lock,
                          color: textFColor,
                        ),
                        hintText: "E-posta giriniz.",
                        hintStyle: TextStyle(color: textFColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      String? message = await UserRepostory()
                          .resetPassword(mailController.text);
                      if (message == "Success") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  TobetoColor().cardColor.withOpacity(0.8),
                              title: const Text(
                                textAlign: TextAlign.center,
                                "E-posta Gönderildi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: const Text(
                                textAlign: TextAlign.center,
                                "Parola yenileme bağlantısı\ne-posta adresinize gönderildi.",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Tamam",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message!)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(mySize / 1.70, 50),
                        backgroundColor: tobetoColor.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "E-posta Gönder",
                      style: TextStyle(color: backgroundColor, fontSize: 15),
                    )),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: Text(
                    "Giriş Yap Sayfasına Geri Dön",
                    style:
                        TextStyle(color: TobetoColor().iconColor, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void darkLightTheme(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
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
}
