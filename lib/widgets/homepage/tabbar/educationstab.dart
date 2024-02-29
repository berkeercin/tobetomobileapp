import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/screens/edu_details.dart';
import 'package:tobetomobileapp/screens/edu_screen.dart';

class EducationsTab extends StatefulWidget {
  const EducationsTab({super.key, required this.eduList});
  final List<Education> eduList;

  @override
  State<EducationsTab> createState() => _EducationsTabState();
}

class _EducationsTabState extends State<EducationsTab> {
  Widget noEducationFound(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            "assets/images/no-survey-found.png",
            height: 250,
          ),
          const Text(
            "Atanmış herhangi bir eğitiminiz bulunmamaktadır",
            softWrap: true,
          )
        ],
      ),
    );
  }

  Widget showMore(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EduScreen(educationList: widget.eduList),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_circle_right_sharp,
            color: TobetoColor().buttonColor,
            size: 50,
          ),
          const Text(
            "Daha Fazla Göster",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        if (widget.eduList.isEmpty)
          noEducationFound(context)
        else
          ...widget.eduList.map((e) {
            return loadEducations(context, e);
          }),
        if (widget.eduList.isNotEmpty) showMore(context)
      ]),
    );
  }

  void checkPercentage(Education education) {
    int total = 0;
    int completed = 0;
    for (var element in education.content) {
      if (element.isFinished) {
        completed++;
      }
      total++;
    }
    if (total == completed && total != 0) {
      HomeRepository().addUsertoFinishedEducation(education.documentId);
    }
  }

  Widget loadEducations(BuildContext context, Education education) {
    checkPercentage(education);
    Color statusColor = Colors.red;
    IconData statusIconData = Iconsax.clock;
    String statusText = "Süresü doldu";
    bool isActive = false;
    String statusMessage = "";
    Duration remainingDuration = education.endDate.difference(DateTime.now());
    int remainingDays = remainingDuration.inDays;
    int remainingHours = remainingDuration.inHours;
    int remainingMinutes = remainingDuration.inMinutes;
    Widget remaining = Container();
    print(remainingDays);
    if (remainingDays <= 30 && remainingDays > 0) {
      statusMessage = "Bitmesine son $remainingDays gün kaldı!";
      remaining = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                statusMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    } else if (remainingDays == 0 &&
        remainingHours > -1 &&
        remainingMinutes > -1) {
      statusMessage = "";

      if (remainingHours >= 0) {
        statusMessage = "Bitmesine son $remainingHours saat kaldı";
        if (remainingHours <= 0) {
          statusMessage = "Bitmesine son $remainingMinutes dakika kaldı";
        }
      }

      remaining = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                statusMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
    if (education.isActive) {
      isActive = true;
      statusColor = Colors.orange;
      statusText = "Devam ediyor";
      if (education.isFinished) {
        statusColor = Colors.green;
        statusIconData = Iconsax.tick_circle;
        statusText = "Eğitim Tamamlandı";
      } else {
        statusIconData = Iconsax.info_circle;
      }
    } else if (education.isFinished) {
      statusColor = Colors.green;
      statusIconData = Iconsax.lock;
      statusText = "Eğitim Tamamlandı";
    }

    Icon statusIcon = Icon(
      statusIconData,
      color: statusColor,
    );
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
                Stack(
                  fit: StackFit.passthrough,
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
                          education.eduThumbnailUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: statusColor),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              statusText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: statusIcon),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        education.eduTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(DateFormat("dd.MM.yyyy")
                              .format(education.startDate)),
                          const Spacer(),
                          remaining
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                FloatingActionButton.small(
                  backgroundColor: isActive ? statusColor : Colors.grey,
                  heroTag: Key(education.eduId),
                  onPressed: () {
                    if (isActive) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EduDetails(
                              contentId: "0",
                              documentId: education.documentId,
                            ),
                          ));
                    }
                  },
                  child:
                      Text(isActive ? "Eğitime Git" : "Eğitimin Süresi Doldu"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
