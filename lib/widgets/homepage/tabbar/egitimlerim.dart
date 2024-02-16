import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/screens/edu_screen.dart';

class Egitimlerim extends StatelessWidget {
  const Egitimlerim({Key? key, required this.videoList}) : super(key: key);
  final List<Education> videoList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoList.length + 1,
        itemBuilder: ((context, index) {
          if (videoList.isEmpty) {
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
            print(index);
            if (index > videoList.length - 1) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EduScreen(educationList: videoList),
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
              Color statusColor = Colors.red;
              IconData statusIconData = Iconsax.clock;
              String statusText = "Süresü doldu";
              if (videoList[index].isActive) {
                statusColor = Colors.orange;
                statusText = "Devam ediyor";
                if (videoList[index].isFinished) {
                  statusColor = Colors.green;
                  statusIconData = Iconsax.tick_circle;
                  statusText = "Tamamlandı";
                } else {
                  statusIconData = Iconsax.info_circle;
                }
              } else if (videoList[index].isFinished) {
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
                      height: 250,
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
                                    videoList[index].eduThumbnailUrl,
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
                                  videoList[index].eduTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(DateFormat("dd.MM.yyyy")
                                    .format(videoList[index].startDate))
                              ],
                            ),
                          ),
                          const Spacer(),
                          FloatingActionButton.small(
                            heroTag: Key(videoList[index].eduId),
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
          }
        }),
      ),
    );
  }
}
