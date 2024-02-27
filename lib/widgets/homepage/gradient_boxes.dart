import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class GradientBoxes extends StatelessWidget {
  const GradientBoxes(
      {super.key, required this.boxButton, required this.boxName});
  final Widget boxButton;

  final String boxName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 175,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [tobetoColor.reviewColor1, tobetoColor.reviewColor2],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Text(
                boxName,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(width: 200, child: boxButton),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

Widget boxButtonF(String key, Function() path) {
  return FloatingActionButton(
    backgroundColor: tobetoColor.iconColor.withOpacity(0.9),
    heroTag: Key(key),
    onPressed: path,
    child: Text(
      TobetoText().boxButtonText,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
