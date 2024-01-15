import 'package:flutter/material.dart';

class ReviewsBoxesModel {
  final String baslik;
  final String metin;
  final Color colorBegin;
  final Color colorEnd;
  final int boxWidth;
  final int boxHeight;
  ReviewsBoxesModel({
    required this.baslik,
    required this.metin,
    required this.colorBegin,
    required this.colorEnd,
    required this.boxWidth,
    required this.boxHeight,
  });
}
