import 'package:flutter/material.dart';

class NewsAlertDialog extends StatelessWidget {
  const NewsAlertDialog({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
    );
  }
}
