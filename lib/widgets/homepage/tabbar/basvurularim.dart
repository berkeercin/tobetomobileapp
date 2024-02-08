import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';

TobetoColor tobetoColor = TobetoColor();
// List<Application> applicationsList = applicationData;

class Basvurularim extends StatelessWidget {
  Basvurularim({Key? key, required this.applicationsList}) : super(key: key);
  final List<Application> applicationsList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: applicationsList.isEmpty
            ? [noApplicationFound()]
            : applicationsList.map((e) {
                return loadAppliaction(context, e);
              }).toList(),
      ),
    );
  }
}

Widget noApplicationFound() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            "assets/images/basvuru.png",
            height: 250,
          ),
          const Text(
            "Herhangi bir yapılımş başvuru bulunmamaktadır",
            softWrap: true,
          )
        ],
      ),
    ),
  );
}

Widget loadAppliaction(BuildContext context, Application application) {
  late String applicationText;
  late Icon applicationIcon;
  late Color applicationColor;
  if (application.applicationStatus == 1) {
    applicationText = "Başvuru Sürecinde";
    applicationIcon = const Icon(Icons.remove);
    applicationColor = Colors.amber.shade700;
  } else if (application.applicationStatus == 2) {
    applicationText = "Reddedildi";
    applicationIcon = const Icon(Icons.close);
    applicationColor = Colors.red;
  } else if (application.applicationStatus == 3) {
    applicationText = "Kabul Edildi";
    applicationIcon = const Icon(Icons.close);
    applicationColor = tobetoColor.cardColor;
  }
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
    child: Card(
      elevation: 6,
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: applicationColor, width: 10),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: 180,
                          child: Text(
                            application.applicationTitle,
                            softWrap: true,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  child: Card(
                      elevation: 7,
                      color: applicationColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          side: BorderSide(width: 0, color: applicationColor)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          applicationText,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: application.subAppliactionList.map((e) {
                    late Icon statusIcon;
                    if (e['status'] == 1) {
                      statusIcon = Icon(
                        Icons.remove,
                        color: Colors.amber.shade700,
                      );
                    } else if (e['status'] == 2) {
                      statusIcon = const Icon(
                        Icons.close,
                        color: Colors.red,
                      );
                    } else if (e['status'] == 3) {
                      statusIcon = Icon(
                        Icons.check,
                        color: tobetoColor.cardColor,
                      );
                    }

                    return Row(
                      children: [
                        statusIcon,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                e['title'],
                                softWrap: true,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ]),
        ),
      ),
    ),
  );
}
