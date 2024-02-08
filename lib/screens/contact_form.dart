import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';

class ContactForm extends StatefulWidget {
  ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  final iconsax = MyIconsax();
  final textEditingController = TextEditingController();
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
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "İLETİŞİM FORMU",
                  style: TextStyle(
                    fontSize: 30,
                    color: textColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.brown, // Kenarlık rengi burada belirleniyor
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      iconColor: TobetoColor().box3EndColor,
                      hintText: "Adınız Soyadınız",
                      hintStyle: TextStyle(color: TobetoColor().textColorText),
                      icon: Icon(Iconsax.user),
                      // border: InputBorder.none, // Kenarlık olmayacaksa bu satırı ekleyin
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.brown, // Kenarlık rengi burada belirleniyor
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      iconColor: TobetoColor().box3EndColor,
                      hintText: "E-Mail",
                      hintStyle: TextStyle(color: TobetoColor().textColorText),
                      icon: Icon(Iconsax.direct_right),
                      // border: InputBorder.none, // Kenarlık olmayacaksa bu satırı ekleyin
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.brown, // Kenarlık rengi burada belirleniyor
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      iconColor: TobetoColor().box3EndColor,
                      hintText: "Mesajınız",
                      hintStyle: TextStyle(color: TobetoColor().textColorText),
                      icon: Icon(Iconsax.message_add),
                      // border: InputBorder.none, // Kenarlık olmayacaksa bu satırı ekleyin
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                        Navigator.pop(context, true);
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
