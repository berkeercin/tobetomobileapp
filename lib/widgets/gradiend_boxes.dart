import 'package:flutter/material.dart';

class GradiendBoxes extends StatelessWidget {
  const GradiendBoxes(
      {super.key,
      required this.boxText,
      required this.boxButton,
      required this.boxColorBegin,
      required this.boxColorEnd});
  final Text boxText;
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
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boxText,
            Spacer(),
            SizedBox(
              child: boxButton,
              width: double.infinity,
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
