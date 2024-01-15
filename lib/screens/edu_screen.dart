import 'package:flutter/material.dart';
import 'package:tobetomobileapp/models/video.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';

class EduScreen extends StatefulWidget {
  const EduScreen({Key? key, required this.videoList}) : super(key: key);
  final List<Video> videoList;
  @override
  _EduScreenState createState() => _EduScreenState();
}

class _EduScreenState extends State<EduScreen> {
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
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: AppBarLogo(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.videoList.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: 500,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/edu-top.png"),
                      fit: BoxFit.cover)),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Text(
                  "Eğitimlerim",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            );
          } else if (index > 0 && index < widget.videoList.length + 1) {
            print(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Image.network(
                              widget.videoList[index - 1].videoThumbnail,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.videoList[index - 1].videoName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.videoList[index - 1].videoDate
                                  .toString()),
                            ],
                          ),
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          heroTag:
                              Key("${widget.videoList[index - 1].videoId}"),
                          onPressed: () {},
                          child: const Text("Eğitime Git"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return TobetoFooter(
              assetImage: assetImage,
              backgroundColor: backgroundColor,
              textColor: textColor,
            );
          }
        },
      ),
    );
  }
}
