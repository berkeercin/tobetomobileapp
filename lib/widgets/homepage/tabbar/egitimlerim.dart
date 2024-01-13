import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/model/video.dart';
import 'package:tobetomobileapp/screens/edu_screen.dart';

class Egitimlerim extends StatelessWidget {
  const Egitimlerim({Key? key, required this.videoList}) : super(key: key);
  final List<Video> videoList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoList.length + 1,
        itemBuilder: ((context, index) {
          if (index > videoList.length - 1) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EduScreen(),
                    ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_right_sharp,
                    color: TobetoColor().cardColor,
                    size: 50,
                  ),
                  const Text("Daha Fazla Göster")
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 250,
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
                              videoList[index].videoThumbnail,
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
                                videoList[index].videoName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(videoList[index].videoDate.toString()),
                            ],
                          ),
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          heroTag: Key("${videoList[index].videoId}"),
                          onPressed: () {},
                          child: const Text("Eğitime Git"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
