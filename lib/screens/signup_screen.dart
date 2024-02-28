import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/screens/reset_passw_screen.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Color backgroundColor;
  late String assetImage;
  late Color textFColor;
  late Color textColor;
  bool isPasswordShown = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final size30 = const SizedBox(height: 30);
  final size14 = const SizedBox(height: 14);
  final iconsax = TobetoIcons();
  final constText = TobetoText();
  final color = TobetoColor();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    darkLightTheme(context);
  }

  void setBoolShown(bool item, String string) {
    setState(() {
      if (string == "Şifre" || string == "Şifreyi Tekrarla") {
        if (item == true) {
          isPasswordShown = true;
        } else {
          isPasswordShown = false;
        }
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 50),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 175),
                  Image.asset(
                    "assets/images/tobeto-logo.png",
                    width: 200,
                    color: textFColor,
                  ),
                  size30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: textBox(
                            textFColor,
                            constText.name,
                            MyIcons(color: textFColor, icon: iconsax.usericon),
                            nameController,
                            null,
                            setBoolShown),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: textBox(
                            textFColor,
                            constText.surname,
                            MyIcons(color: textFColor, icon: iconsax.usericon),
                            surnameController,
                            null,
                            null),
                      )
                    ],
                  ),
                  size14,
                  textBox(
                      textFColor,
                      constText.email,
                      MyIcons(
                        color: textFColor,
                        icon: iconsax.emailIcon,
                      ),
                      emailController,
                      null,
                      null),
                  size14,
                  textBox(
                      textFColor,
                      constText.passwordHintText,
                      MyIcons(color: textFColor, icon: iconsax.passwordicon),
                      passwordController,
                      isPasswordShown,
                      setBoolShown),
                  size14,
                  textBox(
                      textFColor,
                      "Şifreyi tekrarla",
                      MyIcons(color: textFColor, icon: iconsax.passwordicon),
                      passwordConfirmController,
                      isPasswordShown,
                      setBoolShown),
                  size30,
                  buttonCreate(
                      context,
                      textColor,
                      backgroundColor,
                      emailController,
                      passwordController,
                      passwordConfirmController,
                      nameController,
                      surnameController),
                  const SizedBox(height: 25),
                  Divider(color: textColor.withOpacity(.3)),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
                          ));
                    },
                    child: constText.resetPassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        constText.account,
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            constText.loginText,
                            style: TextStyle(
                                fontSize: 16,
                                color: color.buttonColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
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

Widget textBox(
    Color color,
    String hintText,
    MyIcons icon,
    TextEditingController controller,
    bool? isShown,
    Function(bool item, String name)? buttonFunc) {
  if (isShown == null) {
    return Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: color,
            )),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    icon: icon,
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: color.withOpacity(0.7),
                    )),
              ),
            )
          ],
        ));
  } else {
    return Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: color,
            )),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isShown,
                decoration: InputDecoration(
                    icon: icon,
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: color.withOpacity(0.7))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  if (isShown) {
                    buttonFunc!(false, hintText);
                  } else {
                    buttonFunc!(true, hintText);
                  }
                },
                icon: Icon(isShown
                    ? TobetoIcons().passVisibilityOffIcon
                    : TobetoIcons().passVisibilityIcon),
                color: color.withOpacity(0.7),
              ),
            )
          ],
        ));
  }
}

Widget buttonCreate(
    BuildContext context,
    Color textColor,
    Color backgroundColor,
    TextEditingController email,
    TextEditingController password,
    TextEditingController passwordConfirm,
    TextEditingController name,
    TextEditingController surname) {
  final mySize = MediaQuery.of(context).size.width;

  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color.buttonColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          minimumSize: MaterialStatePropertyAll(Size(mySize, 45))),
      onPressed: () {
        if (email.text == "" ||
            password.text == "" ||
            passwordConfirm.text == "" ||
            name.text == "" ||
            surname.text == "") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Tüm alanların doldurulması zorunludur.")));
        } else if (password.text != passwordConfirm.text) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Girdiğiniz parola ve parola tekrarı uyuşmuyor!")));
        } else {
          context.read<AuthBloc>().add(SignUpUser(
                context: context,
                email: email.text,
                name: name.text,
                password: password.text,
                surname: surname.text,
              ));
        }
      },
      child: Text(
        TobetoText().signupText,
        style: TextStyle(color: backgroundColor, fontSize: 18),
      ));
}
