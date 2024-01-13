import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class topTextWidget extends StatefulWidget {
  const topTextWidget({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  State<topTextWidget> createState() => _topTextWidgetState();
}

class _topTextWidgetState extends State<topTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TOBETO",
            style: TextStyle(
              color: TobetoColor().logoTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "'ya hoş geldin",
            style: TextStyle(
              color: widget.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            " ${TobetoText().userName}",
            style: TextStyle(
              color: widget.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      )
    ]);
  }
}
