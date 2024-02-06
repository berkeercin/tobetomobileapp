import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_bloc.dart';
import 'package:tobetomobileapp/blocs/auth/auth_event.dart';
import 'package:tobetomobileapp/blocs/auth/auth_state.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/screens/calendar_screen.dart';
import 'package:tobetomobileapp/screens/catalog_screen.dart';
import 'package:tobetomobileapp/screens/home_screen.dart';
import 'package:tobetomobileapp/screens/login_screen.dart';
import 'package:tobetomobileapp/screens/profile_screen.dart';
import 'package:tobetomobileapp/screens/reviews_screen.dart';

class TobetoDrawer extends StatefulWidget {
  const TobetoDrawer({Key? key}) : super(key: key);

  @override
  _TobetoDrawerState createState() => _TobetoDrawerState();
}

class _TobetoDrawerState extends State<TobetoDrawer> {
  bool isBorderOpen = false;

  Color border = Colors.grey.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    late String assetImage;
    late Color textColor;
    late Color backgroundColor;
    if (brightness == Brightness.dark) {
      setState(() {
        assetImage = 'assets/images/tobeto-logo.png';
        textColor = Colors.white;
        backgroundColor = Colors.black;
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = 'assets/images/tobeto-logo2.png';
        textColor = Colors.black;
        backgroundColor = Colors.white;
      });
    }
    TextStyle drawerStyle = TextStyle(color: textColor);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print(state);
          if (state is LoadedUser) {
            return Drawer(
              backgroundColor: backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacement(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(user: state.user)));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Image(
                            image: AssetImage(assetImage),
                            height: 120,
                            width: 200,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context, true);
                            });
                          },
                          icon: const Icon(Icons.close),
                          iconSize: 32),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(user: state.user),
                                    ));
                              });
                            },
                            child: Text(
                              "Anasayfa",
                              style: drawerStyle,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ReviewsScreen()));
                              });
                            },
                            child: Text(
                              "Değerlendirmeler",
                              style: drawerStyle,
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen(
                                            user: state.user,
                                          )));
                            });
                          },
                          child: Text(
                            "Profilim",
                            style: drawerStyle,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CatalogScreen()));
                            },
                            child: Text(
                              "Katolog",
                              style: drawerStyle,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CalendarScreen()));
                            },
                            child: Text(
                              "Takvim",
                              style: drawerStyle,
                            )),
                        const Divider(),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Tobeto",
                                style: drawerStyle,
                              ),
                              Icon(
                                Icons.home_outlined,
                                color: drawerStyle.color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isBorderOpen == false) {
                          border = textColor;
                          isBorderOpen = true;
                        } else {
                          if (isBorderOpen) {
                            border = textColor.withOpacity(0.3);
                            isBorderOpen = false;
                          }
                        }
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: border, width: 2.0),
                                borderRadius: BorderRadius.circular(8)),
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${state.user.name} ${state.user.surname}"),
                                  const Icon(Icons.person)
                                ],
                              ),
                            ))),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 20),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: color.cardColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          context.read<AuthBloc>().add(ReturnLoginScreen());
                        });
                      },
                      child: Text("Çıkış Yap",
                          style: TextStyle(color: color.logoTextColor)),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text("© 2022 Tobeto",
                        style: TextStyle(color: textColor.withOpacity(0.5))),
                  )
                ],
              ),
            );
          }
          return Drawer(
            child: Center(child: Text("Bilinmedik durum!")),
          );
        },
        // child:
      ),
    );
  }
}
