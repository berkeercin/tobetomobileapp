import 'package:flutter/material.dart';

class GradientBoxes extends StatelessWidget {
  const GradientBoxes(
      {super.key,
      required this.text,
      required this.style,
      required this.boxButton,
      required this.boxColorBegin,
      required this.boxColorEnd});
  final FloatingActionButton boxButton;
  final Color boxColorBegin;
  final Color boxColorEnd;
  final String text;
  final TextStyle style;
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
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                text,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(
              child: boxButton,
              width: double.infinity,
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
