import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';

class ReviewsBoxesButtons extends StatelessWidget {
  const ReviewsBoxesButtons(
      {super.key,
      required this.baslik,
      required this.metin,
      this.reviewButton});
  final Text baslik;
  final Text metin;
  final ElevatedButton? reviewButton;
  @override
  Widget build(BuildContext context) {
    final double phoneHeight = MediaQuery.of(context).size.height;
    final double phoneWidth = MediaQuery.of(context).size.width;
    TobetoColor colorTab = TobetoColor();
    return Container(
      padding: TobetoSize().profilePadding / 2,
      width: phoneWidth * 0.9,
      height: phoneHeight / 3,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(colors: [
            colorTab.reviewColor1,
            colorTab.reviewColor2,
          ], begin: Alignment.topLeft, end: Alignment.topRight)),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            baslik,
            metin,
            if (reviewButton != null) reviewButton!,
          ],
        ),
      ),
    );
  }
}
