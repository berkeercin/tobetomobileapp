import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class TobetoFooter extends StatelessWidget {
  const TobetoFooter(
      {Key? key,
      required this.assetImage,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);
  final String assetImage;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();
    return Container(
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
                        width: 125,
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
                          color: Colors.white.withOpacity(0.5), fontSize: 18)),
                  SizedBox(
                    height: 15,
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
