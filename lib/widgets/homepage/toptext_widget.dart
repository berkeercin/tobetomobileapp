import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/models/user.dart';

class TopTextWidget extends StatefulWidget {
  const TopTextWidget({super.key, required this.textColor, required this.user});

  final Color textColor;
  final UserData user;
  @override
  State<TopTextWidget> createState() => _TopTextWidgetState();
}

class _TopTextWidgetState extends State<TopTextWidget> {
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
            " ${widget.user.name}",
            style: TextStyle(
              color: widget.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
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
