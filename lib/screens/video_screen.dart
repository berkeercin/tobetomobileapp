// import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_event.dart';
import 'package:tobetomobileapp/models/home_page/education_content.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/screens/edu_module_details.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen(
      {Key? key,
      required this.eduContent,
      required this.arrayIndex,
      required this.contentId,
      required this.documentId,
      required this.videoId})
      : super(key: key);
  final EducationContent eduContent;
  final int arrayIndex;
  final String contentId;
  final String documentId;
  final String videoId;
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

void closePage(BuildContext context, int arrayIndex, String documentId,
    String contentId, String videoId, VideoPlayerController controller) async {
  // Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => EduModuleDetails(
  //         arrayIndex: arrayIndex,
  //         documentId: documentId,
  //       ),
  //     ));
  HomeRepository().addUsertoFinishedVideo(documentId, contentId, videoId);
  // await Future.delayed(Duration(seconds: 2));
  controller.removeListener(() {});
  controller.dispose();
  context.read<EduContentBloc>().add(ReloadPage());
  Navigator.pop(context);
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
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    try {
      Uri videoUrl_ = Uri.parse(widget.eduContent.videoURL);
      _controller = VideoPlayerController.networkUrl(videoUrl_)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _controller.addListener(() async {
                if (_controller.value.isPlaying) {
                  setState(() {
                    isPlaying = true;
                  });
                } else if (_controller.value.isCompleted) {
                  closePage(context, widget.arrayIndex, widget.documentId,
                      widget.contentId, widget.videoId, _controller);
                }
              });
            });
          }
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          // setState(() {});
        });
    } catch (e) {
      print(e);
    }
    // print(widget.eduContent.videoURL);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // isPlaying = false;
    _controller.removeListener(() {});
    _controller.dispose();
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
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          if (didPop) {
            if (_controller.value.isPlaying) {
              _controller.pause();
              setState(() {
                isPlaying = false;
              });
            }
          }
        },
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width / 1,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Yükleniyor")
                        ],
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
        ),
      ),
    );
  }
}
