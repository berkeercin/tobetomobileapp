import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';

class GradientBoxes extends StatelessWidget {
  const GradientBoxes(
      {super.key,
    
      required this.boxButton,
      required this.boxColorBegin,
      required this.boxColorEnd});
  final FloatingActionButton boxButton;
  final Color boxColorBegin;
  final Color boxColorEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 175,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [boxColorBegin, boxColorEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft),
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
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                TobetoText().boxButtonText,
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(child: boxButton, width: 200),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
