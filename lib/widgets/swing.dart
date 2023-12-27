import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';

class Swing extends StatefulWidget {
  const Swing({required this.button});
  final Widget button;
  @override
  _SwingState createState() => _SwingState();
}

class _SwingState extends State<Swing> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _movementAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _rotationAnimation =
        Tween<double>(begin: -0.3, end: 0.3).animate(_controller);
    _movementAnimation =
        Tween<Offset>(begin: Offset(-20, 0.0), end: Offset(20, 0.0))
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: -_movementAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              child: widget.button,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class swing_metod extends StatelessWidget {
  const swing_metod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swing(
        button: FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: TobetoColor().boxButton,
      foregroundColor: Colors.white,
      onPressed: () {},
      child: Icon(Icons.chat_bubble_rounded),
    ));
  }
}
