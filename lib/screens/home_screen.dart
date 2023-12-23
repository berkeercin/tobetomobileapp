import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/tobeto_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Kullanıcı";
  int selectedButton = 1;
  late Widget menu;
  late String assetImage;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  late String istanbulKodluyorImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access context-dependent values or do context-dependent initialization here
    var brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
      istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-dark.png';
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-light.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }

    // Initialize the menu with the first container
    menu = container1;
  }

  Widget container1 = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("İstanbul Kodluyor"), Text("Bilgilendirme")],
                ),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green,
                  ),
                  child: Text("Kabul edildi"),
                ),
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.check),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "İstanbul Kodluyor Başvuru Formu",
                    softWrap: true,
                  ),
                  Text(
                    "onaylandı.",
                  ),
                ],
              )
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İstanbul Kodluyor Belge Yükleme",
                      softWrap: true,
                    ),
                    Text(
                      "Formu onaylandı.",
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget container2 = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      child: Column(
        children: [
          Row(
            children: [
              Text("Eğitimlerim"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget container3 = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Duyuru ve Haberlerim"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget container4 = Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Anketlerim"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget buildMenu(int id) {
    if (id == 1) {
      return container1;
    } else if (id == 2) {
      return container2;
    } else if (id == 3) {
      return container3;
    } else if (id == 4) {
      return container4;
    } else {
      return Container();
    }
  }

  Widget button(String name, int buttonId) {
    Color notSelectedTextColor = textColor.withOpacity(0.3);
    Color selectedTextColor = textColor;

    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedButton = buttonId;
              print(selectedButton);
              menu = buildMenu(selectedButton);
            });
          },
          child: Text(
            name,
            style: TextStyle(
              color: (selectedButton == buttonId)
                  ? selectedTextColor
                  : notSelectedTextColor,
            ),
          ),
        ),
        if (selectedButton == buttonId)
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
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        title: const Text("TOBETO Anasayfa"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            SizedBox(
              height: 15,
            ),
            Text(
              "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: containerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                  top: 8,
                ),
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
                            textAlign: TextAlign.center,
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
                                  fontSize: 24,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "İş",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "\"",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                " Burada",
                                style: TextStyle(fontSize: 24),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              button("Başvurularım", 1),
                              button("Eğitimlerim", 2),
                            ],
                          ),
                          Row(
                            children: [
                              button("Duyuru ve Haberlerim", 3),
                              button("Anketlerim", 4),
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
            SizedBox(
              height: 15,
            ),
            Container(
              color: containerColor,
              width: 150,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: containerColor,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sınavlarım"),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  "Herkes için Kodlama 1D \nDeğerlendirme Sınavı"),
                              Spacer(),
                              Icon(Icons.check_box)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Herkes için Kodlama - 1D",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(Icons.timer),
                              Text(
                                "45 Dakika",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.purple, textColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Profilini oluştur",
                              style: TextStyle(
                                  fontSize: 24, color: backgroundColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FloatingActionButton(
                              heroTag: Key("start1"),
                              onPressed: () {},
                              child: Text(
                                "Başla",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.purple, textColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Kendini değerlendir",
                              style: TextStyle(
                                  fontSize: 24, color: backgroundColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FloatingActionButton(
                              heroTag: Key("start2"),
                              onPressed: () {},
                              child: Text(
                                "Başla",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.purple, textColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Öğrenmeye başla",
                              style: TextStyle(
                                  fontSize: 24, color: backgroundColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FloatingActionButton(
                              heroTag: Key("start3"),
                              onPressed: () {},
                              child: Text(
                                "Başla",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.purple,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: AssetImage(assetImage),
                                  height: 150,
                                  width: 150,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Bize Ulaşın",
                                        style: TextStyle(color: textColor)),
                                  ),
                                )
                              ],
                            ),
                            Text("© 2022 Tobeto",
                                style: TextStyle(
                                    color: backgroundColor.withOpacity(0.5),
                                    fontSize: 18)),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const TobetoDrawer(),
    );
  }
}
