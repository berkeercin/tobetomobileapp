import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_event.dart';
import 'package:tobetomobileapp/constants/global/images_const.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';

class TobetoAppBarTitle extends StatefulWidget {
  const TobetoAppBarTitle({this.title, super.key, required this.brightness});
  final Brightness brightness;
  final String? title;

  @override
  State<TobetoAppBarTitle> createState() => _TobetoAppBarTitleState();
}

class _TobetoAppBarTitleState extends State<TobetoAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.white;
    if (widget.brightness == Brightness.light) {
      setState(() {
        iconColor = TobetoColor().reviewColor1;
      });
    }
    IconButton iconButton = IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Iconsax.arrow_left,
        color: iconColor,
      ),
    );
    if (widget.title != null) {
      if (widget.title == "HomePage") {
        setState(() {
          iconButton = IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: iconColor,
              ));
        });
      }
    }

    late String logo;
    late Color color;
    MyImages myImages = MyImages();
    if (widget.brightness == Brightness.dark) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              iconButton,
              SizedBox(
                width: MediaQuery.of(context).size.width / 5.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(user: state.user),
                      ));
                },
                child: Center(
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

class TobetoAppBarV2 extends StatefulWidget implements PreferredSizeWidget {
  const TobetoAppBarV2({
    super.key,
    this.title,
  });
  final String? title;

  @override
  State<TobetoAppBarV2> createState() => _TobetoAppBarV2State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TobetoAppBarV2State extends State<TobetoAppBarV2> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    // TODO: implement build
    // throw UnimplementedError();

    return AppBar(
      title: TobetoAppBarTitle(
        brightness: brightness,
        title: widget.title,
      ),
      actions: [
        if (widget.title == "CatalogScreen")
          Padding(
            padding: const EdgeInsets.only(bottom: 2, right: 16),
            child: InkWell(
              child: const Icon(Icons.refresh),
              onTap: () {
                context.read<CatalogBloc>().add(LoadCatalog(brightness, null));
              },
            ),
          )
      ],
      automaticallyImplyLeading: false,
      // leading: Padding(
      //     padding: const EdgeInsets.only(left: 12.0),
      //     child: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(Iconsax.arrow_left_1))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
