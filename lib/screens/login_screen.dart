import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
    } else if (brightness == Brightness.light) {
      assetImage = 'assets/images/tobeto-logo2.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
    }
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
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
                              Icon(
                                Icons.person_2_outlined,
                                color: textColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      hintText: "Kullanıcı Adı",
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
                              Icon(
                                Icons.lock_outline,
                                color: textColor.withOpacity(0.5),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: isPasswordShown,
                                  decoration: InputDecoration(
                                      hintText: "Şifre",
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
                              minimumSize: const MaterialStatePropertyAll(
                                  Size(300, 40))),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => HomeScreen()));
                          },
                          child: Text(
                            "GİRİŞ YAP",
                            style: TextStyle(color: backgroundColor),
                          )),
                      const Spacer(),
                      const Divider(),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Şifremi Unuttum",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
