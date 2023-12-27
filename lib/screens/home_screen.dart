import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/appBar_logo.dart';
import 'package:tobetomobileapp/constants/text_const.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/gradiend_boxes.dart';
import 'package:tobetomobileapp/widgets/swing.dart';
import 'package:tobetomobileapp/widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/toptext_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    padding: EdgeInsets.all(8),
    child: Card(
      elevation: 6,
      child: ClipPath(
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: TobetoColor().cardColor, width: 10),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text("İstanbul Kodluyor"),
                      Text("Bilgilendirme")
                    ],
                  ),
                  Card(
                      elevation: 7,
                      color: TobetoColor().cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          side: BorderSide(
                              width: 5, color: TobetoColor().cardColor)),
                      child: Text(
                        " Kabul edildi. ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.check,
                  color: TobetoColor().cardColor,
                ),
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
                  Icon(
                    Icons.check,
                    color: TobetoColor().cardColor,
                  ),
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
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
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
        flexibleSpace: appBarLogo(),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: swing_metod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            topTextWidget(textColor: textColor),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: containerColor,
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
                                color: TobetoColor().cardColor,
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
                                color: TobetoColor().cardColor,
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
                              Icon(
                                Icons.check_box,
                                color: TobetoColor().iconColor,
                              )
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
                              Icon(
                                Icons.timer_sharp,
                                color: TobetoColor().logoTextColor,
                              ),
                              Text(
                                " 45 Dakika",
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

            /************------GRADİEND -------****************** */
            Column(
              children: [
                GradiendBoxes(
                    boxText: Text(
                      TobetoText().BoxText1,
                      style: TextStyle(fontSize: 24, color: textColor),
                      textAlign: TextAlign.center,
                    ),
                    boxButton: FloatingActionButton(
                      backgroundColor: TobetoColor().boxButton,
                      heroTag: Key("start1"),
                      onPressed: () {},
                      child: Text(TobetoText().BoxButtonText),
                    ),
                    boxColorBegin: TobetoColor().box1BeginColor,
                    boxColorEnd: TobetoColor().box1EndColor),
                //2
                SizedBox(
                  height: 10,
                ),
                GradiendBoxes(
                    boxText: Text(
                      TobetoText().BoxText2,
                      style: TextStyle(fontSize: 24, color: backgroundColor),
                      textAlign: TextAlign.center,
                    ),
                    boxButton: FloatingActionButton(
                      backgroundColor: TobetoColor().boxButton,
                      heroTag: Key("start2"),
                      onPressed: () {},
                      child: Text(TobetoText().BoxButtonText),
                    ),
                    boxColorBegin: TobetoColor().box2BeginColor,
                    boxColorEnd: TobetoColor().box2EndColor),
                //3
                SizedBox(
                  height: 10,
                ),

                GradiendBoxes(
                    boxText: Text(
                      TobetoText().BoxText3,
                      style: TextStyle(fontSize: 24, color: backgroundColor),
                      textAlign: TextAlign.center,
                    ),
                    boxButton: FloatingActionButton(
                      backgroundColor: TobetoColor().boxButton,
                      heroTag: Key("start3"),
                      onPressed: () {},
                      child: Text(TobetoText().BoxButtonText),
                    ),
                    boxColorBegin: TobetoColor().box3BeginColor,
                    boxColorEnd: TobetoColor().box3EndColor),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            /************------GRADİEND -------****************** */
            Container(
              child: Column(
                children: [
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
                                  height: 100,
                                  width: 100,
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
    );
  }
}
