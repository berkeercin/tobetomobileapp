import 'package:flutter/material.dart';

class NewsAlertDialog extends StatelessWidget {
  const NewsAlertDialog({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
    );
  }
}
