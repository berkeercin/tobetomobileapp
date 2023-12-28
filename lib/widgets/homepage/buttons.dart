import 'package:flutter/material.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/anketlerim.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/basvurularim.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/duyurular.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/egitimlerim.dart';

class ButtonCreator extends StatefulWidget {
  ButtonCreator(
      {Key? key,
      required this.name,
      required this.buttonId,
      required this.textColor,
      required this.selectedButton,
      required this.menu,
      required this.onPressed})
      : super(key: key);
  final String name;
  final int buttonId;
  final Color textColor;
  final int selectedButton;
  final void Function(Widget newWidget) onPressed;
  Widget menu;
  @override
  State<ButtonCreator> createState() => _ButtonCreatorState();
}

class _ButtonCreatorState extends State<ButtonCreator> {
  Widget container1 = Basvurularim();
  Widget container2 = Egitimlerim();
  Widget container3 = Duyurular();
  Widget container4 = Anketlerim();

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
              print(selectedButton);
              if (selectedButton == 1) {
                widget.onPressed(Basvurularim());
              } else if (selectedButton == 2) {
                widget.onPressed(Egitimlerim());
              } else if (selectedButton == 3) {
                widget.onPressed(Duyurular());
              } else if (selectedButton == 4) {
                widget.onPressed(Anketlerim());
              } else {
                widget.onPressed(Container());
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
