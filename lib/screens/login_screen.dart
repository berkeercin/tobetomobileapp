import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      color: Colors.white),
                  padding: const EdgeInsets.all(16),
                  width: 500,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/images/tobeto-logo2.png',
                        width: 150,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8)),
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(Icons.person_2_outlined),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                      hintText: "Kullanıcı Adı",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
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
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8)),
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(Icons.lock_outline),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: isPasswordShown,
                                  decoration: const InputDecoration(
                                      hintText: "Şifre",
                                      border: InputBorder.none,
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
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
                                      : Icons.visibility_off))
                            ],
                          )),
                      const Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              minimumSize: const MaterialStatePropertyAll(
                                  Size(300, 40))),
                          onPressed: () {},
                          child: const Text(
                            "GİRİŞ YAP",
                            style: TextStyle(color: Colors.white),
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
