import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

final color = TobetoColor();
TextStyle style = TextStyle(color: color.textColorbox, fontSize: 20);
TextStyle styleBold = TextStyle(
    color: color.textColorbox, fontSize: 25, fontWeight: FontWeight.bold);

class ReviewsText {
  Text topText1 = Text(
    "Yetkinliklerini ",
    style: TextStyle(color: color.iconColor, fontSize: 30),
  );
  Text topText2 = Text(
    "ücretsiz ölç, ",
    style: TextStyle(color: color.textColorText, fontSize: 30),
  );
  Text topText3 = Text(
    "bilgilerini ",
    style: TextStyle(color: color.iconColor, fontSize: 30),
  );
  Text topText4 = Text(
    " test et. ",
    style: TextStyle(
      color: color.textColorText,
      fontSize: 30,
    ),
  );
  Text box1Baslik = Text("Tobeto İşte Başarı Modeli", style: styleBold);
  Text box1Metin = Text(
      "80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan.",
      style: style);
  Text box2Baslik = Text("Yazılımda Başarı Testi", style: styleBold);
  Text box2Metin =
      Text("Çoktan seçmeli sorular ile teknik bilgini test et. ", style: style);
  Text box3Baslik = Text("Kazanım Odaklı Testler", style: styleBold);
  Text box3Metin = Text(
      "Dijital gelişim kategorisindeki eğitimlere başlamadan öncekonuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.",
      style: style);
  Text box4Baslik =
      Text("Huawei Talent Interview Teknik Bilgi Sınavı*", style: styleBold);
  Text box4Metin = const Text(
      "Sertifika alabilmen için, eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür.\n4400+ soru | 30+ programlama dili | 4 zorluk seviyesi\n *Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.",
      style: TextStyle(fontSize: 15, color: Colors.white));
  Text b1Baslik = Text("Front End", style: style);
  Text b2Baslik = Text("Back End", style: style);
  Text b3Baslik = Text("Full Stack", style: style);
  Text b4Baslik = Text("Microsoft SQL Server", style: style);
  Text b5Baslik = Text("Masaüstü Programlama", style: style);
  Text body1 = Text("Aboneliğe özel ",
      style: TextStyle(color: color.cardColor, fontSize: 30));
  Text body2 = Text(
    "değerlendirme araçları için  ",
    style: TextStyle(color: color.textColorText, fontSize: 30),
  );
  Text boxbutton1 = Text("Raporu Görüntüle ", style: style);
  Text boxbutton2 = Text("Başla", style: style);
}
