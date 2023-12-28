import 'package:flutter/material.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';

ColorScheme scheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.purple, // Choose your primary color
  accentColor: Colors.orange, // Choose your accent color
  backgroundColor: Colors.white,
  brightness: Brightness.light, // Use Brightness.dark for dark theme
);
ColorScheme scheme2 = ColorScheme.fromSwatch(
  primarySwatch: Colors.purple, // Choose your primary color
  accentColor: Colors.orange, // Choose your accent color
  backgroundColor: Colors.black,
  brightness: Brightness.dark, // Use Brightness.dark for dark theme
);
// ColorScheme scheme =
//     ColorScheme.fromSwatch(primarySwatch: MaterialColor(primary, swatch) );
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        useMaterial3: true, colorScheme: scheme, brightness: Brightness.light),
    darkTheme: ThemeData(
        useMaterial3: true, colorScheme: scheme2, brightness: Brightness.dark),
    themeMode: ThemeMode.system,
    home: const LoginScreen(),
  ));
}
