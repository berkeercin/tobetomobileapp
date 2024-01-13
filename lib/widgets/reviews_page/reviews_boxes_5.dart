import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/constants/global/tobeto_size.dart';
import 'package:tobetomobileapp/functions/reviewspage/reviews_lessonsbox_alert.dart';

class ReviewsBoxes5 extends StatelessWidget {
  ReviewsBoxes5({
    super.key,
    required this.baslik,
  });
  final Text baslik;
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 25,
    );
    final double phoneHeight = MediaQuery.of(context).size.height;
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: TobetoSize().profilePadding / 2,
          width: phoneWidth * 0.91,
          height: phoneHeight / 9.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.iconColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.book_rounded,
                color: color.cardColor,
                size: 35,
              ),
              baslik,
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LessonsBoxAlert(
                            lessonName: baslik,
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: ReviewsText().boxbutton2),
            ],
          ),
        ),
        sizedBox,
      ],
    );
  }
}
