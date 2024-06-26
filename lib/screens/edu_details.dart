import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_bloc.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_event.dart';
import 'package:tobetomobileapp/blocs/educontent/educontent_state.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/models/home_page/educationlist_content.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/screens/edu_module_details.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class EduDetails extends StatefulWidget {
  const EduDetails(
      {super.key, required this.documentId, required this.contentId});
  final String documentId;
  final String contentId;
  @override
  _EduDetailsState createState() => _EduDetailsState();
}

class _EduDetailsState extends State<EduDetails> {
  late EduContentBloc _eduContentBloc;
  int sizeOf = 0;
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

  Future<int> countPercentage(EducationContentList eduContent) async {
    double total = 0;
    int complated = 0;
    int totalInt = 0;
    eduContent.subContent.forEach((element) {
      if (element.isFinished) {
        complated += 1;
      }
      total += 1;
    });
    total = complated / total * 100;
    totalInt = total.floor();
    if (total == 100) {
      HomeRepository()
          .addUsertoFinishedContent(widget.documentId, eduContent.contentId);
    }

    return totalInt;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EduContentBloc, EduContentState>(
      listener: (context, state) {},
      child: BlocBuilder<EduContentBloc, EduContentState>(
        builder: (context, state) {
          if (state is Initialize) {
            context
                .read<EduContentBloc>()
                .add(LoadContent("0", widget.documentId));
            return Scaffold(
              appBar: AppBar(title: const Text("Sayfa yükleniyor...")),
              body: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sayfa yükleniyor..."),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          }
          if (state is LoadedPage) {
            return Scaffold(
              appBar: AppBar(
                  title: Text(
                state.education.eduTitle,
                style: TextStyle(color: tobetoColor.buttonColor, fontSize: 20),
              )),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.education.content.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                        future: countPercentage(state.education.content[index]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            double doublePercentage = snapshot.data! / 100;
                            Color progressColor = tobetoColor.cardColor;
                            String progressText =
                                "%${snapshot.data} tamamlandı";
                            if (doublePercentage == 1.00) {
                              progressColor = tobetoColor.cardColor;
                              progressText = "Modül başarıyla tamamlandı!";
                            }
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EduModuleDetails(
                                        arrayIndex: index,
                                        documentId: widget.documentId,
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: tobetoColor.reviewColor1
                                        .withOpacity(.6)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 26.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        doublePercentage < 1.00
                                            ? CircleAvatar(
                                                backgroundColor: Colors.white
                                                    .withOpacity(.9),
                                                child: Transform.scale(
                                                  scaleY: -1,
                                                  child: RotationTransition(
                                                    turns:
                                                        const AlwaysStoppedAnimation(
                                                            180 / 360),
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              progressColor),
                                                      value: doublePercentage,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Icon(TobetoIcons().eduComp,
                                                color: progressColor, size: 46),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          state.education.content[index]
                                              .contentTitle,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          progressText,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        const Spacer()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  Text("Yükleniyor")
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text("Hata")),
              body: const Center(
                  child: Text("Bilinmeyen bir hata ile karşılaşıldı.")),
            );
          }
        },
      ),
    );
  }
}
