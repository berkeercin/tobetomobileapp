import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class BoxesAlert extends StatelessWidget {
  const BoxesAlert({super.key, required this.errorMes});
  final String errorMes;

  Future<void> errormessage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TobetoColor().reviewColor2.withOpacity(0.8),
          title: const Text(
            "Bilinmeyen Hata",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          content: Text(
            errorMes,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tamam",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
