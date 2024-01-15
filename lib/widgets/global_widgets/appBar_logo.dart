import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/login_screen/loginscreen_bloc.dart';
import 'package:tobetomobileapp/blocs/login_screen/loginscreen_state.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key, required this.brightness});
  final Brightness brightness;
  @override
  Widget build(BuildContext context) {
    late String logo;
    MyImages myImages = MyImages();
    if (brightness == Brightness.dark) {
      logo = myImages.darkThemeLogo;
    } else {
      logo = myImages.lightThemeLogo;
    }
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      builder: (context, state) {
        if (state is LoadedUser) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(user: state.user),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Image.asset(
                    logo,
                    width: 150,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text("Bilinmeyen Hata");
        }
      },
    );
  }
}
