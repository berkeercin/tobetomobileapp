import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';

class TobetoText {
  final String passwordHintText = "Şifre";
  final String email = "E-posta";
  final String name = "İsim";
  final String surname = "Soyisim";
  final String loginText = "Giriş Yap";
  final String signupText = "Kayıt Ol";
  Text resetPassword = Text(
    "Parolamı unuttum",
    style: TextStyle(color: TobetoColor().iconColor, fontSize: 18),
  );

  final String boxButtonText = "Başla";
  final String boxText1 = "Profilini Oluştur";
  final String boxText2 = "Kendini Değerlendir";
  final String boxText3 = "Öğrenmeye Başla";
  final String account = "Hesabınız var mı?";
  final String noAccount = "Hesabınız yok mu?";
}
