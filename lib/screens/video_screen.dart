// import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/models/home_page/education_content.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.eduContent}) : super(key: key);
  final EducationContent eduContent;
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  //  late FlickManager flickManager;
  late VideoPlayerController _controller;
  List<DeviceOrientation> previousOrientations = [];
  double speed = 1;
  String speedTitle = "1x";
  bool isPlaying = false;
  @override
  void initState() {
    print(widget.eduContent.videoURL);
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    String videoUrl = widget.eduContent.videoURL;
    Uri videoUrl_ = Uri.parse(widget.eduContent.videoURL);
    _controller = VideoPlayerController.networkUrl(videoUrl_)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        setState(() {
          isPlaying = true;
        });
      } else if (_controller.value.isCompleted) {
        setState(() {
          isPlaying = false;
        });
        print("completed");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.pause();
    SystemChrome.setPreferredOrientations(previousOrientations);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isPlaying = false;
    // if (_controller.value.isPlaying) {
    //   setState(() {
    //     isPlaying = true;
    //   });
    // }
    // if (_controller.value.isCompleted) {
    //   setState(() {
    //     isPlaying = false;
    //   });
    //   print("complated");
    // }
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1,
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Yükleniyor")
                      ],
                    ),
                  ),
                ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(.5),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Iconsax.arrow_left,
                      color: Colors.white,
                    )),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPlaying = !_controller.value.isPlaying;
                      isPlaying ? _controller.play() : _controller.pause();
                    });
                  },
                  icon: Icon(
                    isPlaying ? Iconsax.pause : Iconsax.play,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (speed == 1) {
                      _controller.setPlaybackSpeed(1.25);
                      speed = 1.25;
                      setState(() {
                        speedTitle = "${speed}x";
                      });
                    } else if (speed == 1.25) {
                      speed = 1.50;
                      _controller.setPlaybackSpeed(speed);
                      setState(() {
                        speedTitle = "${speed}x";
                      });
                    } else if (speed == 1.50) {
                      speed = 1.75;
                      _controller.setPlaybackSpeed(speed);
                      setState(() {
                        speedTitle = "${speed}x";
                      });
                    } else if (speed == 1.75) {
                      speed = 2.0;
                      _controller.setPlaybackSpeed(speed);
                      setState(() {
                        speedTitle = "${speed}x";
                      });
                    } else {
                      speed = 1.0;
                      _controller.setPlaybackSpeed(speed);

                      setState(() {
                        speedTitle = "${speed}x";
                      });
                    }
                  },
                  child: Text(
                    speedTitle,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
