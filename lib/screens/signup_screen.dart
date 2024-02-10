import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Color backgroundColor;
  late String assetImage;
  late Color textColor;
  bool isPasswordShown = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final size30 = const SizedBox(height: 30);
  final size10 = const SizedBox(height: 10);
  final iconsax = MyIconsax();
  final constText = TobetoText();

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
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Padding(
                padding: const EdgeInsets.all(45),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.background),
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  width: MediaQuery.of(context).size.height / 2,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      size30,
                      Image.asset(
                        assetImage,
                        width: 150,
                      ),
                      size30,
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: textBox(
                                textColor,
                                constText.name,
                                iconsax.usericon,
                                nameController,
                                null,
                                setBoolShown),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: textBox(
                                textColor,
                                constText.surname,
                                iconsax.usericon,
                                surnameController,
                                null,
                                null),
                          )
                        ],
                      ),
                      size10,
                      textBox(textColor, constText.email, iconsax.emailIcon,
                          emailController, null, null),
                      size10,
                      textBox(
                          textColor,
                          constText.passwordHintText,
                          iconsax.passwordicon,
                          passwordController,
                          isPasswordShown,
                          setBoolShown),
                      size10,
                      textBox(
                          textColor,
                          "Şifreyi tekrarla",
                          iconsax.passwordicon,
                          passwordConfirmController,
                          isPasswordShown,
                          setBoolShown),
                      size10,
                      const Spacer(),
                      buttonCreate(
                          context,
                          textColor,
                          backgroundColor,
                          emailController,
                          passwordController,
                          passwordConfirmController,
                          nameController,
                          surnameController),
                      const Spacer(),
                      Divider(color: textColor.withOpacity(.3)),
                      TextButton(
                        onPressed: () {},
                        child: constText.parolamiUnuttum,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            constText.hesapVar,
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                constText.girisYap,
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
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
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = LightThemeStyle().lightThemeImage;
        textColor = LightThemeStyle().lightTextColor;
        backgroundColor = LightThemeStyle().lightBackgroundColor;
      });
    }
  }
}

Widget textBox(
    Color color,
    String hintText,
    Icon icon,
    TextEditingController controller,
    bool? isShown,
    Function(bool item, String name)? buttonFunc) {
  if (isShown == null) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8)),
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            MyIcons(color: color, icon: icon),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: color.withOpacity(0.5),
                    )),
              ),
            )
          ],
        ));
  } else {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8)),
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            MyIcons(color: color, icon: MyIconsax().passwordicon),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isShown,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: color.withOpacity(0.5))),
              ),
            ),
            IconButton(
              onPressed: () {
                if (isShown) {
                  buttonFunc!(false, hintText);
                } else {
                  buttonFunc!(true, hintText);
                }
              },
              icon: Icon(isShown
                  ? MyIconsax().passVisibilityOffIcon
                  : MyIconsax().passVisibilityIcon),
              color: color.withOpacity(0.5),
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
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(textColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          minimumSize: const MaterialStatePropertyAll(Size(300, 40))),
      onPressed: () {
        if (
            email.text == "" ||
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
        TobetoText().kayitol,
        style: TextStyle(color: backgroundColor, fontSize: 18),
      ));
}
