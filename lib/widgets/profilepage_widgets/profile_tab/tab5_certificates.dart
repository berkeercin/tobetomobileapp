import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';

class ProfileTabCertificates extends StatelessWidget {
  const ProfileTabCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: TobetoSize().profilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sertifikalarım",
              style:
                  TextStyle(color: TobetoColor().logoTextColor, fontSize: 50),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.deepPurple)),
                    width: phoneWidth * 5,
                    height: phoneHeight / 2,
                    child: Column(children: [
                      Image.asset('assets/images/document.png'),
                      const Text("Dosya Yükle"),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
