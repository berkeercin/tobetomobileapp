import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/dummydata/profile_data.dart';
import 'package:tobetomobileapp/models/user.dart';
import 'package:tobetomobileapp/screens/edit_profile_screen.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final UserData user;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String assetImage;
  String footerImage = "assets/images/tobeto-logo.png";
  late Brightness brightness_;
  late Color textColor;
  late Color backgroundColor;
  final icons = TobetoIcons();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateColorList();
  }

  void updateColorList() {
    Brightness brightness = Theme.of(context).brightness;
    brightness_ = brightness;
    setState(() {
      assetImage = brightness == Brightness.dark
          ? 'assets/images/tobeto-logo.png'
          : 'assets/images/tobeto-logo2.png';
      textColor = brightness == Brightness.dark ? Colors.white : Colors.black;
      backgroundColor =
          brightness == Brightness.dark ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TobetoAppBarV2(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Iconsax.edit,
                      size: 30,
                      color: tobetoColor.iconColor,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Icon(
                      Iconsax.share,
                      size: 30,
                      color: tobetoColor.iconColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            color: TobetoColor().reviewColor1),
                        height: 125,
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: textColor,
                                radius: 50,
                                child: Image.asset(
                                  "assets/images/profile-photo.png",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: backgroundColor),
                        height: 270,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  icons.usericons,
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ad Soyad",
                                        style: TextStyle(
                                            fontSize: 14, color: textColor),
                                      ),
                                      Text(
                                        "${widget.user.name} ${widget.user.surname}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  icons.calendar2,
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Doğum Tarihi",
                                        style: TextStyle(
                                            fontSize: 14, color: textColor),
                                      ),
                                      Text(
                                        "Doğum tarihi sistemde belirtilmemiş.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  icons.emailIcon2,
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "E-Posta Adresi",
                                        style: TextStyle(
                                            fontSize: 14, color: textColor),
                                      ),
                                      Text(
                                        "E-Posta adresi sistemde belirtilmemiş.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                        softWrap: true,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  icons.tel,
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Telefon Numarası",
                                        style: TextStyle(
                                            fontSize: 14, color: textColor),
                                      ),
                                      Text(
                                        "Telefon numarası sistemde belirtilmemiş.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                        softWrap: true,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hakkımnda"),
                            Divider(
                              color: textColor,
                            ),
                            const Text(
                              "Hakkımda bilgisi bulunamadı.",
                              softWrap: true,
                              style: TextStyle(fontSize: 18),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Yetkinliklerim"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Henüz bir yetkinlik eklemedin.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Yabancı Dillerim"),
                        Divider(
                          color: textColor,
                        ),
                        const Text(
                            "Herhangi bir yabancı dil verisi bulunamadı.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Sertifikalarım"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Henüz bir sertifika yüklemedin.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Medya Hesaplarım"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Henüz bir hesap eklemedin.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 200,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Tobeto İşte Başarı Modelim"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Raporu görmek için sınava girmelisiniz.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Card(
                elevation: 10,
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Tobeto Seviye Testlerim"),
                        Divider(
                          color: textColor,
                        ),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: competenceList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 10,
                                child: Container(
                                  color: backgroundColor,
                                  height: 100,
                                  width: 370,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(competenceList[index]
                                            .competenceName),
                                        const Spacer(),
                                        Text(DateFormat("dd.MM.yyyy").format(
                                            competenceList[index]
                                                .competenceDate)),
                                        const Spacer(),
                                        Text(competenceList[index]
                                            .competenceScore)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Yetkinlik Rozetlerim"),
                        Divider(
                          color: textColor,
                        ),
                        Container(
                          height: 100,
                          width: 370,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Image.asset(
                                    'assets/images/istanbul-kodluyor-light.png',
                                    height: 118,
                                    width: 118,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Aktivite Haritam"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Herhangi bir aktiviteniz bulunamadı.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Eğitim Hayatım ve Deneyimlerim"),
                        Divider(
                          color: textColor,
                        ),
                        const Text("Herhangi bir eğitim verisi bulunamadı.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TobetoFooter(
                assetImage: footerImage,
                backgroundColor: backgroundColor,
                textColor: textColor)
          ],
        ),
      ),
    );
  }
}
