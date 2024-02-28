import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/functions/reviewspage/reviews_lessonsbox_alert.dart';

class ReviewsBoxes5 extends StatelessWidget {
  ReviewsBoxes5({
    super.key,
    required this.baslik,
  });
  final Text baslik;
  final icons = TobetoIcons();
  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 25,
    );
    final double phoneHeight = MediaQuery.of(context).size.height;
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: phoneWidth * 0.91,
          height: phoneHeight / 9.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: color.reviewColor1,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icons.lesson,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: baslik,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LessonsBoxAlert(
                                lessonName: baslik,
                              );
                            });
                      },
                      icon: icons.next),
                ),
              ],
            ),
          ),
        ),
        sizedBox,
      ],
    );
  }
}
