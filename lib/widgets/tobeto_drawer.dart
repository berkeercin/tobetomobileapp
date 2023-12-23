import 'package:flutter/material.dart';

class TobetoDrawer extends StatefulWidget {
  const TobetoDrawer({Key? key}) : super(key: key);

  @override
  _TobetoDrawerState createState() => _TobetoDrawerState();
}

class _TobetoDrawerState extends State<TobetoDrawer> {
  @override
  bool isBorderOpen = false;

  Color border = Colors.grey.withOpacity(0.3);
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
    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
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
                  onPressed: () {}, icon: Icon(Icons.close), iconSize: 32),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Anasayfa",
                      style: drawerStyle,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Değerlendirmeler",
                      style: drawerStyle,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Profilim",
                      style: drawerStyle,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Katolog",
                      style: drawerStyle,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Takvim",
                      style: drawerStyle,
                    )),
                Divider(),
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
                padding: const EdgeInsets.only(left: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: border, width: 2.0),
                          borderRadius: BorderRadius.circular(16)),
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("İsim Soyisim"), Icon(Icons.person)],
                        ),
                      )),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24),
            child: Text("© 2022 Tobeto",
                style: TextStyle(color: textColor.withOpacity(0.5))),
          )
        ],
      ),
    );
  }
}
