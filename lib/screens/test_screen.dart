import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/tobeto_drawer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String user = "Kullanıcı";
  late String assetImage;
  late Color textColor;
  late Color backgroundColor;
  late Color containerColor;
  late String istanbulKodluyorImage;
  int selectedButton = 1;
  Widget menu = Container();

  @override
  void initState() {
    super.initState();

    updateTheme();
  }

  void updateTheme() {
    Future.delayed(Duration(milliseconds: 500));
    var brightness = MediaQuery.of(context).platformBrightness;
    setState(() {
      if (brightness == Brightness.dark) {
        assetImage = 'assets/images/tobeto-logo.png';
        textColor = Colors.white;
        backgroundColor = Colors.black;
        containerColor = Colors.grey.withOpacity(.1);
        istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-dark.png';
      } else {
        assetImage = 'assets/images/tobeto-logo2.png';
        istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-light.png';
        textColor = Colors.black;
        backgroundColor = Colors.white;
        containerColor = backgroundColor;
      }
    });
  }

  Widget buildButton(String name, int buttonId) {
    var brightness = MediaQuery.of(context).platformBrightness;

    bool isSelected = selectedButton == buttonId;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedButton = buttonId;
            });
          },
          child: Text(
            name,
            style: TextStyle(
                color: isSelected ? textColor : textColor.withOpacity(0.3)),
          ),
        ),
        if (isSelected)
          SizedBox(
            height: 1,
            width: 120,
            child: Container(
              color: textColor,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    updateTheme();

    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        title: const Text("TOBETO Anasayfa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "TOBETO",
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "'ya hoş geldin",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              " $user",
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: containerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, left: 16, right: 16, top: 8),
                child: Column(
                  children: [
                    Image(
                      height: 200,
                      width: 200,
                      image: AssetImage(istanbulKodluyorImage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Text(
                            "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 15),
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
                          Row(
                            children: [
                              buildButton("Başvurularım", 1),
                              buildButton("Eğitimlerim", 2),
                            ],
                          ),
                          Row(
                            children: [
                              buildButton("Duyuru ve Haberlerim", 3),
                              buildButton("Anketlerim", 4),
                            ],
                          ),
                          menu,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const TobetoDrawer(),
    );
  }
}
