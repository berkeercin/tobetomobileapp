import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/constants/text_const.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/homepage/buttons.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/anketlerim.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/basvurularim.dart';
import 'package:tobetomobileapp/widgets/homepage/gradient_boxes.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/duyurular.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/egitimlerim.dart';
import 'package:tobetomobileapp/widgets/homepage/toptext_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedButton = 1;
  late Widget menu;
  late String assetImage;
  late Brightness brightness;
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
    brightness = MediaQuery.of(context).platformBrightness;

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
    menu = Basvurularim();
  }

  void updateMenu(Widget newMenu) {
    setState(() {
      menu = newMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: appBarLogo(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: swing_method(),
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
                                color: tobetoColor.cardColor,
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
                                color: tobetoColor.cardColor,
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
                            ButtonCreator(
                              name: "Başvurularım",
                              buttonId: 1,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              menu: menu,
                              onPressed: (newWidget) {
                                updateMenu(newWidget);
                              },
                            ),
                            ButtonCreator(
                              name: "Eğitimlerim",
                              buttonId: 2,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              menu: menu,
                              onPressed: (newWidget) {
                                updateMenu(newWidget);
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ButtonCreator(
                              name: "Duyuru ve Haberlerim",
                              buttonId: 3,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              menu: menu,
                              onPressed: (newWidget) {
                                updateMenu(newWidget);
                              },
                            ),
                            ButtonCreator(
                              name: "Anketlerim",
                              buttonId: 4,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              menu: menu,
                              onPressed: (newWidget) {
                                updateMenu(newWidget);
                              },
                            )
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
                                color: tobetoColor.iconColor,
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
                                color: tobetoColor.logoTextColor,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  verticalDirection: VerticalDirection.up,
                  children: [
                    GradientBoxes(
                        text: TobetoText().BoxText1,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: Key("start1"),
                          onPressed: () {},
                          child: Text(TobetoText().BoxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box1BeginColor,
                        boxColorEnd: tobetoColor.box1EndColor),
                    //2
                    SizedBox(
                      width: 10,
                    ),
                    GradientBoxes(
                        text: TobetoText().BoxText2,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: Key("start2"),
                          onPressed: () {},
                          child: Text(TobetoText().BoxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box2BeginColor,
                        boxColorEnd: tobetoColor.box2EndColor),
                    //3
                    SizedBox(
                      width: 10,
                    ),

                    GradientBoxes(
                        text: TobetoText().BoxText3,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: Key("start3"),
                          onPressed: () {},
                          child: Text(TobetoText().BoxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box3BeginColor,
                        boxColorEnd: tobetoColor.box3EndColor),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            /************------GRADİENT -------****************** */
            Container(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    color: tobetoColor.logoTextColor,
                    child: Column(children: [
                      Column(
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
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 18)),
                          SizedBox(
                            height: 15,
                          )
                        ],
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
