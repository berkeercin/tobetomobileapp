import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_colors.dart';
import 'package:tobetomobileapp/dummydata/news_list.dart';
import 'package:intl/intl.dart';
import 'package:tobetomobileapp/functions/homepage/showalertdialog_news.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key, required this.newsList});
  final List<News> newsList;

  Widget noNewsFound(BuildContext context) {
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
              "Herhangi bir haber ya da duyuru bulunmamaktadır",
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newsList.isEmpty
            ? [noNewsFound(context)]
            : newsList.map((n) {
                return loadNews(context, n);
              }).toList(),
      ),
    );
  }

  Widget loadNews(BuildContext context, News news) {
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
                    Text(news.isNews ? "Haber" : "Duyuru"),
                    Text(news.projectName)
                  ],
                ),
                const Spacer(),
                Text(
                  news.notifTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(DateFormat("dd.MM.yyyy").format(news.notifTime))
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          ShowAlertDialogNews(
                                  context: context,
                                  content: news.notifContent,
                                  title: news.notifTitle)
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
  }
}
