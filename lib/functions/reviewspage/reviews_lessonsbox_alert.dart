import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class LessonsBoxAlert extends StatelessWidget {
  const LessonsBoxAlert({super.key, required this.lessonName});
  final Text lessonName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: TobetoColor().cardColor.withOpacity(0.8),
      title: lessonName,
      content: const Column(
        children: [
           SizedBox(
            height: 50,
          ),
          Text(
            "Bu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır. Sınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız taktırde çözdüğünüz kısım kadarıyla değerlendirileceksiniz.",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Sınav Süresi : 30 Dakika \n Soru Sayısı : 25 \n Soru Tipi : Çoktan Seçmeli",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Sınava Başla',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
