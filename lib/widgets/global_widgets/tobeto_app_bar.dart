import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/constants/global/images_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';

class TobetoAppBar extends StatelessWidget {
  const TobetoAppBar({super.key, required this.brightness});
  final Brightness brightness;
  @override
  Widget build(BuildContext context) {
    late String logo;
    late Color color;
    MyImages myImages = MyImages();
    if (brightness == Brightness.dark) {
      logo = myImages.darkThemeLogo;
      color = Colors.white;
    } else {
      logo = myImages.lightThemeLogo;
      color = TobetoColor().iconColor;
    }
    return BlocBuilder<AuthBloc, AuthState>(
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
                    color: color,
                    logo,
                    width: 150,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text("Bilinmeyen Hata");
        }
      },
    );
  }
}
