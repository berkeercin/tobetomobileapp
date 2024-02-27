import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/screens/contact_info.dart';

class TobetoFooter extends StatelessWidget {
  const TobetoFooter(
      {super.key,
      required this.assetImage,
      required this.backgroundColor,
      required this.textColor});
  final String assetImage;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 120,
            color: tobetoColor.iconColor,
            child: Column(children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: AssetImage(assetImage),
                        height: 75,
                        width: 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactInfo(),
                                ));
                          },
                          child: Text("Bize Ulaşın",
                              style: TextStyle(color: textColor)),
                        ),
                      )
                    ],
                  ),
                  Text("© 2022 Tobeto",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
