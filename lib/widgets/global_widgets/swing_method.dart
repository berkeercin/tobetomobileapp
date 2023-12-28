import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing.dart';

class swing_method extends StatelessWidget {
  const swing_method({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swing(
        button: SpeedDial(
      shape: CircleBorder(),
      backgroundColor: TobetoColor().boxButton,
      foregroundColor: Colors.white,
      elevation: 20,
      overlayOpacity: 0,
      childPadding: EdgeInsets.all(8),
      child: Icon(Icons.chat_bubble_rounded),
      children: [
        SpeedDialChild(
          backgroundColor: TobetoColor().boxButton,
          child: Icon(
            Icons.chat_outlined,
            color: Colors.white,
          ),
          onTap: () {},
        ),
        SpeedDialChild(
            child: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            backgroundColor: Colors.green)
      ],
    ));
  }
}
