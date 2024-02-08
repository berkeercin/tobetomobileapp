import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';

class HomeExam extends StatelessWidget {
  HomeExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sınavlarım",
            style: TextStyle(fontSize: 20),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Herkes için Kodlama 1D \nDeğerlendirme Sınavı",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      MyIconsax().examtick,
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Herkes için Kodlama - 1D",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      MyIconsax().examtimer,
                      const Text(
                        " 45 Dakika",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
