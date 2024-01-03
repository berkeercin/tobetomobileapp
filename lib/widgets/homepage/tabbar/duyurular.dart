import 'package:flutter/material.dart';
import 'package:tobetomobileapp/dummydata/news_list.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/functions/showalertdialog_news.dart';
import 'package:tobetomobileapp/widgets/homepage/alertdialog_news.dart';

class Duyurular extends StatelessWidget {
  const Duyurular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                height: 175,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
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
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
