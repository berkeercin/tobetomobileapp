import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';
import 'package:tobetomobileapp/widgets/tobeto_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String assetImage;
  late Color textColor;
  late Color backgroundColor;
  final String userHintText = "Kullanıcı Adı";
  final String passwordHintText = "Şifre";
  final String buttonText = "GİRİŞ YAP";
  Text parolamiUnuttum = Text(
    "Parolamı unuttum",
    style: TextStyle(color: Colors.blue),
  );

  @override
  Widget build(BuildContext context) {
    darkLightTheme(context);
    return Scaffold(
      drawer: TobetoDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages().projectBackground),
                fit: BoxFit.cover)),
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
                height: 350,
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
                                icon: MyIconsName().passVisibilityIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                    hintText: userHintText,
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
                                icon: MyIconsName().passwordIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: passwordController,
                                obscureText: isPasswordShown,
                                decoration: InputDecoration(
                                    hintText: passwordHintText,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: textColor.withOpacity(0.5))),
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
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: textColor.withOpacity(0.5),
                            )
                          ],
                        )),
                    const Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(textColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            minimumSize:
                                const MaterialStatePropertyAll(Size(300, 40))),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()));
                        },
                        child: Text(
                          buttonText,
                          style: TextStyle(color: backgroundColor),
                        )),
                    const Spacer(),
                    const Divider(),
                    TextButton(
                      onPressed: () {},
                      child: parolamiUnuttum,
                    ),
                  ],
                ),
              ),
            )
          ],
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

class MyImages {
  final darkThemeLogo = "assets/images/tobeto-logo.png";
  final lightThemeLogo = "assets/images/tobeto-logo2.png";
  final projectBackground = "assets/images/background.jpg";
}

class LightThemeStyle {
  final lightTextColor = Colors.black;
  final lightThemeImage = MyImages().lightThemeLogo;
  final lightBackgroundColor = Colors.white;
}

class DarkThemeStyle {
  final darkTextColor = Colors.white;
  final darkThemeImage = MyImages().darkThemeLogo;
  final darkBackgroundColor = Colors.black;
}

class MyTextFields extends TextField {
  final Icon icons; //icons iste

  MyTextFields(this.icons);
}

class MyIcons extends StatelessWidget {
  final Color color;
  final Icon icon;
  MyIcons({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon.icon,
      color: color.withOpacity(0.5),
    );
  }
}

class MyIconsName {
  final userNameIcon = Icon(Icons.person_2_outlined);
  final passwordIcon = Icon(Icons.lock_outline);
  final passVisibilityIcon = Icon(Icons.visibility);
  final passVisibilityOffIcon = Icon(Icons.visibility_off);
}
