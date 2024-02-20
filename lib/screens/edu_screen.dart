import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/screens/edu_details.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';

class EduScreen extends StatefulWidget {
  const EduScreen({Key? key, required this.educationList}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.95),
      appBar: AppBar(
        flexibleSpace: TobetoAppBar(brightness: brightness),
      ),
      drawer: const TobetoDrawer(),
      floatingActionButton: const SwingMethod(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            );
          } else if (index > 0 && index < widget.educationList.length + 1) {
            // print(index);
            Color statusColor = Colors.red;
            IconData statusIconData = Iconsax.clock;
            String statusText = "Süresü doldu";
            Duration remainingDuration = widget.educationList[index - 1].endDate
                .difference(DateTime.now());
            int remainingDays = remainingDuration.inDays;
            int remainingHours = remainingDuration.inHours;
            int remainingMinutes = remainingDuration.inMinutes;
            Widget remaining = Container();
            if (remainingDays <= 30 && remainingDays > 0) {
              String statusMessage = "Bitmesine son $remainingDays gün kaldı!";
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
            if (widget.educationList[index - 1].isActive) {
              statusColor = Colors.orange;
              statusText = "Devam ediyor";
              if (widget.educationList[index - 1].isFinished) {
                statusColor = Colors.green;
                statusIconData = Iconsax.tick_circle;
                statusText = "Tamamlandı";
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
                                widget.educationList[index - 1].eduTitle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(DateFormat("dd.MM.yyyy").format(widget
                                      .educationList[index - 1].startDate)),
                                  Spacer(),
                                  remaining
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        FloatingActionButton.small(
                          heroTag:
                              Key("${widget.educationList[index - 1].eduId}"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EduDetails(
                                    contentId: "0",
                                    documentId: widget
                                        .educationList[index - 1].documentId,
                                  ),
                                ));
                          },
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
