import 'package:flutter/material.dart';

class GradientBoxes extends StatelessWidget {
  const GradientBoxes(
      {super.key,
      required this.boxButton,
      required this.boxColorBegin,
      required this.boxColorEnd,
      required this.boxName});
  final FloatingActionButton boxButton;
  final Color boxColorBegin;
  final Color boxColorEnd;
  final String boxName;
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
