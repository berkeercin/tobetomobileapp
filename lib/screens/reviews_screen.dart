import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/reviews/reviews_text.dart';
import 'package:tobetomobileapp/functions/homepage/boxes_alert.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';
import 'package:tobetomobileapp/widgets/reviews_page/reviews_boxes_5.dart';
import 'package:tobetomobileapp/widgets/reviews_page/reviews_boxes_buttons.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewText = ReviewsText();
    var sizedBox = SizedBox(
      height: 25,
    );
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: appBarLogo(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            sizedBox,
            Container(
                // width: 200,
                child: Column(
              children: [
                reviewText.topText1,
                reviewText.topText2,
                reviewText.topText3,
                reviewText.topText4,
              ],
            )),
            sizedBox,
            // Box1(reviewText: reviewText, colorTab: colorTab),
            ReviewsBoxesButtons(
              baslik: reviewText.box1Baslik,
              metin: reviewText.box1Metin,
              reviewButton: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    BoxesAlert(
                      errorMes: "Rapor Görüntülemek İçin Sınava Girmelisiniz.",
                    ).errormessage(context);
                  },
                  child: reviewText.boxbutton1),
            ),
            sizedBox,
            ReviewsBoxesButtons(
                baslik: reviewText.box2Baslik, metin: reviewText.box2Metin),
            sizedBox,
            ReviewsBoxes5(
              baslik: reviewText.b1Baslik,
            ),
            ReviewsBoxes5(baslik: reviewText.b2Baslik),
            ReviewsBoxes5(baslik: reviewText.b3Baslik),
            ReviewsBoxes5(baslik: reviewText.b4Baslik),
            ReviewsBoxes5(baslik: reviewText.b5Baslik),
            Container(
                // width: 200,
                child: Column(
              children: [
                reviewText.body1,
                reviewText.body2,
              ],
            )),
            sizedBox,
            ReviewsBoxesButtons(
                baslik: reviewText.box3Baslik, metin: reviewText.box3Metin),
            sizedBox,
            ReviewsBoxesButtons(
                baslik: reviewText.box4Baslik, metin: reviewText.box4Metin),
            sizedBox,
            TobetoFooter(
              assetImage: assetImage,
              backgroundColor: backgroundColor,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }
}
