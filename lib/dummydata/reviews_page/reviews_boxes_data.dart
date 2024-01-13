import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/model/reviews_page/reviews_boxes_model.dart';

List<ReviewsBoxesModel> boxesModel = [
  ReviewsBoxesModel(
    baslik: "Tobeto İşte Başarı Modeli",
    metin:
        "80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan.",
    colorBegin: Colors.purpleAccent,
    colorEnd: Colors.purple.shade900,
    boxWidth: 50,
    boxHeight: 50,
  ),
  ReviewsBoxesModel(
    baslik: "Yazılımda Başarı Testi",
    metin: "Çoktan seçmeli sorular ile teknik bilgini test et.",
    colorBegin: Colors.purpleAccent,
    colorEnd: Colors.purple,
    boxWidth: 50,
    boxHeight: 50,
  ),
  ReviewsBoxesModel(
      baslik: "Front End",
      metin: "",
      colorBegin: Colors.white,
      colorEnd: TobetoColor().box3EndColor,
      boxWidth: 80,
      boxHeight: 50)
];
