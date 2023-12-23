import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/tobeto_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Kullanıcı";

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    late String assetImage;
    late Color textColor;
    late Color backgroundColor;
    late Color containerColor;
    late String istanbulKodluyorImage;
    if (brightness == Brightness.dark) {
      setState(() {
        assetImage = 'assets/images/tobeto-logo.png';
        textColor = Colors.white;
        backgroundColor = Colors.black;
        containerColor = Colors.grey.withOpacity(.1);
        istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-dark.png';
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = 'assets/images/tobeto-logo2.png';
        istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-light.png';
        textColor = Colors.black;
        backgroundColor = Colors.white;
        containerColor = backgroundColor;
      });
    }
    return Scaffold(
        backgroundColor: backgroundColor.withOpacity(0.95),
        appBar: AppBar(
          title: const Text("TOBETO Anasayfa"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "TOBETO",
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "'ya hoş geldin",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    " $user",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    color: containerColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, left: 16, right: 16, top: 8),
                      child: Column(
                        children: [
                          Image(
                              height: 200,
                              width: 200,
                              image: AssetImage(istanbulKodluyorImage)),
                          Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Aradığın",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      " \"",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.green),
                                    ),
                                    Text(
                                      "İş",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      "\"",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.green),
                                    ),
                                    Text(
                                      " Burada",
                                      style: TextStyle(fontSize: 24),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Center()
            ],
          ),
        ),
        drawer: const TobetoDrawer());
  }
}
