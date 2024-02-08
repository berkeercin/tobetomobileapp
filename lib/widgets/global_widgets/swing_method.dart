import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing.dart';

class SwingMethod extends StatefulWidget {
  const SwingMethod({
    super.key,
  });

  @override
  State<SwingMethod> createState() => _SwingMethodState();
}

class _SwingMethodState extends State<SwingMethod> {
  bool isOpen = false;
  isOpenFunc(bool val) {
    setState(() {
      if (val == true) {
        isOpen = val;
      } else {
        isOpen = val;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isOpen
        ? FABwithoutAnimation(
            isOpen: isOpenFunc,
          )
        : FABwithAnimation(
            isOpen: isOpenFunc,
          );
  }
}

class FABwithAnimation extends StatefulWidget {
  FABwithAnimation({super.key, required this.isOpen});
  final void Function(bool val) isOpen;
  final color = TobetoColor();

  @override
  State<FABwithAnimation> createState() => _FABwithAnimationState();
}

class _FABwithAnimationState extends State<FABwithAnimation> {
  @override
  Widget build(BuildContext context) {
    return Swing(
        button: SpeedDial(
      shape: const CircleBorder(),
      backgroundColor: color.logoTextColor, //animasyon rengi
      foregroundColor: Colors.white,
      elevation: 20,
      overlayOpacity: 0,
      onOpen: () {
        setState(() {
          widget.isOpen(true);
        });
      },
      childPadding: const EdgeInsets.all(8),
      child: const Icon(
        size: 30,
        Iconsax.message,
      ),
    ));
  }
}

class FABwithoutAnimation extends StatelessWidget {
  const FABwithoutAnimation({
    required this.isOpen,
    super.key,
  });
  final void Function(bool val) isOpen;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      isOpenOnStart: true,
      shape: const CircleBorder(),
      backgroundColor: color.logoTextColor,
      foregroundColor: Colors.white,
      elevation: 20,
      overlayOpacity: 0,
      onClose: () {
        isOpen(false);
      },
      childPadding: const EdgeInsets.all(8),
      children: [
        SpeedDialChild(
          backgroundColor: color.logoTextColor,
          child: const Icon(
            Iconsax.message,
            color: Colors.white,
          ),
          onTap: () {},
        ),
        SpeedDialChild(
            child: const Icon(
              Iconsax.messages_2,
              color: Colors.white,
            ),
            backgroundColor: color.cardColor)
      ],
      child: const Icon(
        size: 30,
        Iconsax.message,
      ),
    );
  }
}
