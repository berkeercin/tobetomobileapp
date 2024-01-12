import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/profile_screen.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/constants/text_const.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/homepage/buttons.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/basvurularim.dart';
import 'package:tobetomobileapp/widgets/homepage/gradient_boxes.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
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

    menu = const Basvurularim();
  }

  void updateMenu(Widget newMenu, int id) {
    setState(() {
      selectedButton = id;
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
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            topTextWidget(textColor: textColor),
            const SizedBox(
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
                        const Text(
                          "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
                            const Text(
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
                            const Text(
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
                              onPressed: (newWidget, number) {
                                updateMenu(newWidget, number);
                              },
                            ),
                            ButtonCreator(
                              name: "Eğitimlerim",
                              buttonId: 2,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              onPressed: (newWidget, number) {
                                updateMenu(newWidget, number);
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
                              onPressed: (newWidget, number) {
                                updateMenu(newWidget, number);
                              },
                            ),
                            ButtonCreator(
                              name: "Anketlerim",
                              buttonId: 4,
                              textColor: textColor,
                              selectedButton: selectedButton,
                              onPressed: (newWidget, number) {
                                updateMenu(newWidget, number);
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
            const SizedBox(
              height: 15,
            ),
            Container(
              color: containerColor,
              width: 150,
            ),
            const SizedBox(
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
                    const Text("Sınavlarım"),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                    "Herkes için Kodlama 1D \nDeğerlendirme Sınavı"),
                                const Spacer(),
                                Icon(
                                  Icons.check_box,
                                  color: tobetoColor.iconColor,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Herkes için Kodlama - 1D",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: tobetoColor.logoTextColor,
                                ),
                                const Text(
                                  " 45 Dakika",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
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
                        text: TobetoText().boxText1,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: const Key("start1"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                          },
                          child: Text(TobetoText().boxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box1BeginColor,
                        boxColorEnd: tobetoColor.box1EndColor),
                    //2
                    const SizedBox(
                      width: 10,
                    ),
                    GradientBoxes(
                        text: TobetoText().boxText2,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: const Key("start2"),
                          onPressed: () {},
                          child: Text(TobetoText().boxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box2BeginColor,
                        boxColorEnd: tobetoColor.box2EndColor),
                    //3
                    const SizedBox(
                      width: 10,
                    ),

                    GradientBoxes(
                        text: TobetoText().boxText3,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                        boxButton: FloatingActionButton(
                          backgroundColor: tobetoColor.boxButton,
                          heroTag: const Key("start3"),
                          onPressed: () {},
                          child: Text(TobetoText().boxButtonText),
                        ),
                        boxColorBegin: tobetoColor.box3BeginColor,
                        boxColorEnd: tobetoColor.box3EndColor),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            /************------GRADİENT -------****************** */
            TobetoFooter(
              assetImage: assetImage,
              backgroundColor: backgroundColor,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }
}
