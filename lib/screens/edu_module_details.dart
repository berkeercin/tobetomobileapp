import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_event.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_state.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/screens/video_screen.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class EduModuleDetails extends StatefulWidget {
  const EduModuleDetails(
      {super.key, required this.arrayIndex, required this.documentId});
  final int arrayIndex;
  final String documentId;
  @override
  _EduModuleDetailsState createState() => _EduModuleDetailsState();
}

class _EduModuleDetailsState extends State<EduModuleDetails> {
  late EduContentBloc _eduContentBloc;

  @override
  void initState() {
    super.initState();
    _eduContentBloc = context.read<EduContentBloc>();
    _eduContentBloc.add(ReloadPage());
  }

  @override
  void dispose() {
    super.dispose();
    _eduContentBloc.add(ReloadPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EduContentBloc, EduContentState>(
      listener: (context, state) {},
      child: BlocBuilder<EduContentBloc, EduContentState>(
        builder: (context, state) {
          if (state is Initialize) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Yükleniyor"),
              ),
              body: const Center(
                  child: Column(
                children: [
                  Text("Safya yükleniyor"),
                  CircularProgressIndicator()
                ],
              )),
            );
          }
          if (state is LoadedPage) {
            return Scaffold(
              appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<EduContentBloc>().add(ReloadPage());
                      },
                      icon: const Icon(
                        Iconsax.refresh,
                        size: 26,
                      ),
                    )
                  ],
                  title: Text(
                    state.education.content[widget.arrayIndex].contentTitle,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: tobetoColor.buttonColor, fontSize: 20),
                  )),
              body: ListView.builder(
                itemCount: state
                    .education.content[widget.arrayIndex].subContent.length,
                itemBuilder: (context, index) {
                  // print(widget.eduContentList[index].isFinished);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                  contentId: state.education
                                      .content[widget.arrayIndex].contentId,
                                  documentId: widget.documentId,
                                  videoId: state
                                      .education
                                      .content[widget.arrayIndex]
                                      .subContent[index]
                                      .videoId,
                                  arrayIndex: widget.arrayIndex,
                                  eduContent: state
                                      .education
                                      .content[widget.arrayIndex]
                                      .subContent[index]),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              state.education.content[widget.arrayIndex]
                                      .subContent[index].isFinished
                                  ? TobetoIcons().eduFinish
                                  : TobetoIcons().eduStart,
                              color: tobetoColor.iconColor,
                              size: 30,
                            ),
                            Text(
                              state.education.content[widget.arrayIndex]
                                  .subContent[index].title,
                              style: TextStyle(
                                  color: tobetoColor.buttonColor, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text("Hata!")),
              body: const Text("Bilinmeyen bir hata ile karşılaşıldı!"),
            );
          }
        },
      ),
    );
  }
}
