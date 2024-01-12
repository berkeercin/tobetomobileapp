import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';
import 'package:tobetomobileapp/dummydata/news_list.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/functions/showalertdialog_news.dart';

class Duyurular extends StatelessWidget {
  const Duyurular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();

    return SizedBox(
      height: 175,
      width: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsList.length + 1,
        itemBuilder: (context, index) {
          if (newsList.isEmpty) {
            return const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            );
          } else if (index < newsList.length) {
            return Card(
              elevation: 6,
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: tobetoColor.cardColor, width: 10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(newsList[index].isNews ? "Haber" : "Duyuru"),
                            Text(newsList[index].projectName)
                          ],
                        ),
                        Spacer(),
                        Text(
                          newsList[index].notifTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text(DateFormat("dd.MM.yyyy")
                                    .format(newsList[index].notifTime))
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  ShowAlertDialogNews(
                                          context: context,
                                          content: newsList[index].notifContent,
                                          title: newsList[index].notifTitle)
                                      .showAlert();
                                },
                                child: const Text("Devamını oku"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
