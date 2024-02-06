import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/firebase_options.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  UserRepostory userRepostory = UserRepostory();
  HomeRepository homeRepository = HomeRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(userRepostory: userRepostory),
      ),
      BlocProvider<CalendarBloc>(
        create: (context) => CalendarBloc(),
      ),
      BlocProvider(
        create: (context) => HomeBloc(homeRepository: homeRepository),
      ),
      BlocProvider(
        create: (context) => CatalogBloc(userRepostory: userRepostory),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: scheme,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: scheme2,
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    ),
  ));
}
