import 'package:flutter/material.dart';

class ShowAlertDialogNews {
  ShowAlertDialogNews(
      {required this.context, required this.content, required this.title});

  final BuildContext context;
  final String title;
  final String content;

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text("Onayla"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
