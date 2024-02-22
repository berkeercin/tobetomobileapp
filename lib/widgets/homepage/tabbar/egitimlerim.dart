import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/screens/edu_details.dart';
import 'package:tobetomobileapp/screens/edu_screen.dart';

class Egitimlerim extends StatelessWidget {
  const Egitimlerim({Key? key, required this.eduList}) : super(key: key);
  final List<Education> eduList;

  void checkPercentage(Education education) {
    int total = 0;
    int completed = 0;
    education.content.forEach((element) {
      if (element.isFinished) {
        completed++;
      }
      total++;
    });
    if (total == completed && total != 0) {
      HomeRepository().addUsertoFinishedEducation(education.documentId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eduList.length + 1,
        itemBuilder: ((context, index) {
          if (eduList.isEmpty) {
            return Column(
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
            );
          } else {
            // print(index);
            if (index > eduList.length - 1 && eduList.isNotEmpty) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EduScreen(educationList: eduList),
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
              checkPercentage(eduList[index]);
              Color statusColor = Colors.red;
              IconData statusIconData = Iconsax.clock;
              String statusText = "Süresü doldu";
              bool isActive = false;
              Duration remainingDuration =
                  eduList[index].endDate.difference(DateTime.now());
              int remainingDays = remainingDuration.inDays;
              int remainingHours = remainingDuration.inHours;
              int remainingMinutes = remainingDuration.inMinutes;
              Widget remaining = Container();
              if (remainingDays <= 30 && remainingDays > 0) {
                String statusMessage =
                    "Bitmesine son $remainingDays gün kaldı!";
              } else if (remainingDays == 0 &&
                  remainingHours > -1 &&
                  remainingMinutes > -1) {
                String statusMessage = "";

                if (remainingHours >= 0) {
                  statusMessage = "Bitmesine son $remainingHours saat kaldı";
                  if (remainingHours >= 0) {
                    statusMessage =
                        "Bitmesine son $remainingMinutes dakika kaldı";
                  }
                }
                remaining = Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          statusMessage,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (eduList[index].isActive) {
                isActive = true;
                statusColor = Colors.orange;
                statusText = "Devam ediyor";
                if (eduList[index - 1].isFinished) {
                  statusColor = Colors.green;
                  statusIconData = Iconsax.tick_circle;
                  statusText = "Eğitim Tamamlandı";
                } else {
                  statusIconData = Iconsax.info_circle;
                }
              } else if (eduList[index].isFinished) {
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
                                    eduList[index].eduThumbnailUrl,
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
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        statusText,
                                        style: TextStyle(color: Colors.white),
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
                                  eduList[index].eduTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(DateFormat("dd.MM.yyyy")
                                        .format(eduList[index].startDate)),
                                    Spacer(),
                                    remaining
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          FloatingActionButton.small(
                            backgroundColor:
                                isActive ? statusColor : Colors.grey,
                            heroTag: Key("${eduList[index].eduId}"),
                            onPressed: () {
                              if (isActive) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EduDetails(
                                        contentId: "0",
                                        documentId:
                                            eduList[index - 1].documentId,
                                      ),
                                    ));
                              }
                            },
                            child: Text(isActive
                                ? "Eğitime Git"
                                : "Eğitimin Süresi Doldu"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
