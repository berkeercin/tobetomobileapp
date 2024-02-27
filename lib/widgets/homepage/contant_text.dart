import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class ContantText extends StatelessWidget {
  const ContantText({super.key, required this.boldText, required this.text});

  final String boldText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            boldText,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: TobetoColor().box3EndColor),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: TobetoColor().textColorText),
          ),
        ],
      ),
    );
  }
}
