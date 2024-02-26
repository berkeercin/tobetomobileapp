import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/blocs/home/home_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_event.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';
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
  late Color backgroundColor;
  bool isRefreshed = false;
  MyIconsax iconsax = MyIconsax();
  final constText = TobetoText();

  void refreshPage() {
    context.read<HomeBloc>().add(RefreshPage());
    isRefreshed = true;
  }

  @override
  Widget build(BuildContext context) {
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
              body: Container(
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(45),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).colorScheme.background),
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                        width: 500,
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Image.asset(
                              assetImage,
                              width: 150,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: textColor),
                                    borderRadius: BorderRadius.circular(8)),
                                height: 50,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyIcons(
                                        color: textColor,
                                        icon: iconsax.usericon),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            hintText: constText.email,
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              color: textColor.withOpacity(0.5),
                                            )),
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: textColor),
                                    borderRadius: BorderRadius.circular(8)),
                                height: 50,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyIcons(
                                        color: textColor,
                                        icon: iconsax.passwordicon),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: isPasswordShown,
                                        decoration: InputDecoration(
                                            hintText:
                                                constText.passwordHintText,
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: textColor
                                                    .withOpacity(0.5))),
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
                                      color: textColor.withOpacity(0.5),
                                    ),
                                  ],
                                )),
                            const Spacer(),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(textColor),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(300, 40))),
                                onPressed: () {
                                  context.read<AuthBloc>().add(LoginUser(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text));
                                },
                                child: Text(
                                  constText.girisYap,
                                  style: TextStyle(color: backgroundColor),
                                )),
                            const Spacer(),
                            Divider(color: textColor.withOpacity(.3)),
                            TextButton(
                              onPressed: () {},
                              child: constText.parolamiUnuttum,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(constText.hesapYok),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen(),
                                          ));
                                    },
                                    child: Text(constText.kayitol)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
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

class MyImages {
  final darkThemeLogo = "assets/images/tobeto-logo.png";
  final lightThemeLogo = "assets/images/tobeto-logo2.png";
  final projectBackground = "assets/images/background.jpg";
}

class MyTextFields extends TextField {
  final Icon icons; //icons iste

  const MyTextFields(this.icons, {super.key});
}
