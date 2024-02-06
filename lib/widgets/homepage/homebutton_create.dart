import 'package:flutter/material.dart';
import 'package:tobetomobileapp/dummydata/video_list.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/anketlerim.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/basvurularim.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/duyurular.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/egitimlerim.dart';

class HomeButtonCreator extends StatefulWidget {
  const HomeButtonCreator(
      {Key? key,
      required this.name,
      required this.buttonId,
      required this.textColor,
      required this.selectedButton,
      required this.onPressed,
      this.applicationList = const []})
      : super(key: key);
  final String name;
  final int buttonId;
  final Color textColor;
  final int selectedButton;
  final List<Application> applicationList;
  final void Function(Widget newWidget, int number) onPressed;
  @override
  State<HomeButtonCreator> createState() => _HomeButtonCreatorState();
}

class _HomeButtonCreatorState extends State<HomeButtonCreator> {
  Widget container1 = Basvurularim(
    applicationsList: [],
  );
  Widget container2 = Egitimlerim(
    videoList: [...videoList],
  );
  Widget container3 = const Duyurular();
  Widget container4 = const Anketlerim();

  @override
  Widget build(BuildContext context) {
    Color notSelectedTextColor = widget.textColor.withOpacity(0.3);
    Color selectedTextColor = widget.textColor;
    int selectedButton = widget.selectedButton;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedButton = widget.buttonId;
              if (selectedButton == 1) {
                widget.onPressed(
                    Basvurularim(applicationsList: widget.applicationList),
                    selectedButton);
              } else if (selectedButton == 2) {
                widget.onPressed(
                    Egitimlerim(
                      videoList: [...videoList],
                    ),
                    selectedButton);
              } else if (selectedButton == 3) {
                widget.onPressed(const Duyurular(), selectedButton);
              } else if (selectedButton == 4) {
                widget.onPressed(const Anketlerim(), selectedButton);
              } else {
                widget.onPressed(Container(), 1);
              }
            });
          },
          child: Text(
            widget.name,
            style: TextStyle(
              color: (selectedButton == widget.buttonId)
                  ? selectedTextColor
                  : notSelectedTextColor,
            ),
          ),
        ),
        if (selectedButton == widget.buttonId)
          SizedBox(
            height: 1,
            width: 120,
            child: Container(
              color: widget.textColor,
            ),
          ),
      ],
    );
  }
}
