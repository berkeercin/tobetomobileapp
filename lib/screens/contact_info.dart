import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/screens/contact_form.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/contant_text.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  final iconsax = MyIconsax();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }
  }

  @override
  void initState() {
    super.initState();
    brightness = Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: TobetoAppBar(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "İLETİŞİM BİLGİLERİ",
                  style: TextStyle(
                    fontSize: 30,
                    color: textColor,
                  ),
                ),
              ),
              const ContantText(boldText: "Firma Adı:", text: "TOBETO"),
              const ContantText(
                  boldText: "Firma Unvanı:",
                  text:
                      "Avez Elektronik İletişim Eğitim \nDanışmanlığı Ticaret Anonim Şirketi"),
              const ContantText(boldText: "Vergi Dairesi:", text: "Beykoz"),
              const ContantText(boldText: "Vergi No:", text: "1050250859"),
              const ContantText(boldText: "Telefon:", text: "(0216) 331 48 00"),
              const ContantText(boldText: "E-Posta:", text: "info@tobeto.com"),
              const ContantText(
                  boldText: "Adres:",
                  text:
                      "Kavacık,\nRüzgarlıbahçe Mah. Çampınarı Sk.\nNo:4 Smart Plaza  \nB Blok Kat:3 34805, \nBeykoz/İstanbul"),
              Center(
                child: Text(
                  "İSTANBUL KODLUYOR",
                  style: TextStyle(
                    fontSize: 30,
                    color: textColor,
                  ),
                ),
              ),
              const ContantText(boldText: "Telefon:", text: "(0216) 969 22 40"),
              const ContantText(
                  boldText: "E-Posta:", text: "istanbulkodluyor@tobeto.com"),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height / 3,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          TobetoColor().textColorText),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactForm(),
                            ));
                      });
                    },
                    child: Text(
                      "Mesaj Bırakın",
                      style: TextStyle(
                          fontSize: 18,
                          color: TobetoColor().box3EndColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
