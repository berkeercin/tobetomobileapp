import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/blocs/home/home_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_event.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';
import 'package:tobetomobileapp/screens/reset_passw_screen.dart';
import 'package:tobetomobileapp/screens/signup_screen.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String assetImage;
  late Color textColor;
  late Color textFColor;
  late Color backgroundColor;
  bool isRefreshed = false;
  MyIconsax iconsax = MyIconsax();
  final constText = TobetoText();
  SizedBox sizedbox = const SizedBox(height: 20);
  void refreshPage() {
    context.read<HomeBloc>().add(RefreshPage());
    isRefreshed = true;
  }

  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size.width;

    darkLightTheme(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is CheckUserLoginData) {}

        if (state is LoadedUser) {
          refreshPage();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  user: state.user,
                ),
              ));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is LogIn) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/tobeto-logo.png",
                        width: 200,
                        color: textFColor,
                      ),
                      sizedbox,
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: textFColor,
                              )),
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        icon: MyIcons(
                                            color: textFColor,
                                            icon: iconsax.emailIcon),
                                        hintText: constText.email,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: textFColor.withOpacity(0.5),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: textFColor,
                              )),
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: isPasswordShown,
                                    decoration: InputDecoration(
                                        icon: MyIcons(
                                          color: textFColor,
                                          icon: iconsax.passwordicon,
                                        ),
                                        hintText: constText.passwordHintText,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color:
                                                textFColor.withOpacity(0.7))),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isPasswordShown) {
                                      isPasswordShown = false;
                                    } else {
                                      isPasswordShown = true;
                                    }
                                  });
                                },
                                icon: Icon(isPasswordShown
                                    ? iconsax.passVisibilityOffIcon
                                    : iconsax.passVisibilityIcon),
                                color: textFColor.withOpacity(0.7),
                              ),
                            ],
                          )),
                      sizedbox,
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(color.cardColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              minimumSize:
                                  MaterialStatePropertyAll(Size(mySize, 50))),
                          onPressed: () {
                            context.read<AuthBloc>().add(LoginUser(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text));
                          },
                          child: Text(
                            constText.loginText,
                            style:
                                TextStyle(color: backgroundColor, fontSize: 16),
                          )),
                      sizedbox,
                      Divider(color: textColor.withOpacity(.3)),
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
                            constText.noAccount,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupScreen(),
                                    ));
                              },
                              child: Text(
                                constText.signupText,
                                style: TextStyle(
                                    fontSize: 16, color: color.cardColor),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: const SwingMethod(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
          } else if (state is CheckUserLoginData) {
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Uygulama yükleniyor"),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          } else if (state is LoadedUser) {
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Uygulama yükleniyor"),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          } else {
            // print(state);
            return Scaffold(
              appBar: AppBar(title: const Text("Hata")),
              body: const Center(child: Text("Bilinmedik durum")),
            );
          }
        },
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


