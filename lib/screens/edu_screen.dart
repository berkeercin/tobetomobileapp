import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';
import 'package:tobetomobileapp/screens/edu_details.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';

class EduScreen extends StatefulWidget {
  const EduScreen({super.key, required this.educationList});
  final List<Education> educationList;
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
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: const TobetoAppBarV2(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.educationList.length + 2,
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
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            );
          } else if (index > 0 && index < widget.educationList.length + 1) {
            // print(index);
            checkPercentage(widget.educationList[index - 1]);
            Color statusColor = Colors.red;
            IconData statusIconData = Iconsax.clock;
            String statusText = "Süresü doldu";
            bool isActive = false;
            String statusMessage = "";
            Duration remainingDuration = widget.educationList[index - 1].endDate
                .difference(DateTime.now());
            int remainingDays = remainingDuration.inDays;
            int remainingHours = remainingDuration.inHours;
            int remainingMinutes = remainingDuration.inMinutes;
            Widget remaining = Container();
            if (remainingDays <= 30 && remainingDays > 0) {
              statusMessage = "Bitmesine son $remainingDays gün kaldı!";
            } else if (remainingDays == 0 &&
                remainingHours > -1 &&
                remainingMinutes > -1) {
              statusMessage = "";
              if (remainingHours >= 0) {
                statusMessage = "Bitmesine son $remainingHours saat kaldı";
                if (remainingHours <= 0) {
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
            if (widget.educationList[index - 1].isActive) {
              isActive = true;
              statusColor = Colors.orange;
              statusText = "Devam ediyor";
              if (widget.educationList[index - 1].isFinished) {
                statusColor = Colors.green;
                statusIconData = Iconsax.tick_circle;
                statusText = "Eğitim Tamamlandı";
              } else {
                statusIconData = Iconsax.info_circle;
              }
            } else if (widget.educationList[index - 1].isFinished) {
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
                                  widget
                                      .educationList[index - 1].eduThumbnailUrl,
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
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                widget.educationList[index - 1].eduTitle,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormat("dd.MM.yyyy").format(widget
                                        .educationList[index - 1].startDate),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                          heroTag:
                              Key("${widget.educationList[index - 1].eduId}"),
                          onPressed: () {
                            if (isActive) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EduDetails(
                                      contentId: "0",
                                      documentId: widget
                                          .educationList[index - 1].documentId,
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
