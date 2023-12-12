import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ColorScheme scheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 153, 51, 255));

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true, colorScheme: scheme, brightness: Brightness.light),
    home: const LoginScreen(),
  ));
}

// // Yeni bir flutter projesi oluşturalım, 
// // Projemizin temel kurulumlarını yapalım.
// // Projemizde kullanılacak temel light-dark color paletini belirleyelim.
// // Projemizde varsa kullanacağımız farklı fontları projeye ekleyelim. ( Size kalmış bir durum isterseniz default fontla devam edin. Öneri: Tobeto'da kullanılan font premium, ona en yakın bulabildiğim font alternativi; https://fonts.google.com/specimen/Tinos)
// Projenize güzel bir readme dosyası yazınız
// // Projenizde ilk olarak açılacak sayfayı (login) tasarlayınız; 
