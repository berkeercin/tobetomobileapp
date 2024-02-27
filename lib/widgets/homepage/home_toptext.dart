import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class HomeToptext extends StatefulWidget {
  const HomeToptext({super.key});

  @override
  State<HomeToptext> createState() => _HomeToptextState();
}

class _HomeToptextState extends State<HomeToptext> {
  TobetoColor tobetoColor = TobetoColor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Aradığın",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              " \"",
              style: TextStyle(
                fontSize: 24,
                color: tobetoColor.cardColor,
              ),
            ),
            const Text(
              "İş",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "\"",
              style: TextStyle(
                fontSize: 24,
                color: tobetoColor.cardColor,
              ),
            ),
            const Text(
              " Burada",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ],
    );
  }
}
