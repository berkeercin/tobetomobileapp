import 'package:flutter/material.dart';

class ReviewsBoxesModel {
  final String baslik;
  final String metin;
  final ElevatedButton reviewsButton;
  final Color colorBegin;
  final Color colorEnd;
  final int boxWidth;
  final int boxHeight;
  final Icon icon;
  ReviewsBoxesModel(
      {required this.baslik,
      required this.metin,
      required this.reviewsButton,
      required this.colorBegin,
      required this.colorEnd,
      required this.boxWidth,
      required this.boxHeight,
      required this.icon});
}
