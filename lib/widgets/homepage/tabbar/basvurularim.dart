import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';

class Basvurularim extends StatelessWidget {
  const Basvurularim({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 6,
        child: ClipPath(
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: tobetoColor.cardColor, width: 10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("İstanbul Kodluyor"),
                          Text("Bilgilendirme")
                        ],
                      ),
                    ),
                    Card(
                        elevation: 7,
                        color: tobetoColor.cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            side: BorderSide(
                                width: 5, color: tobetoColor.cardColor)),
                        child: Text(
                          " Kabul edildi. ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.check,
                    color: tobetoColor.cardColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İstanbul Kodluyor Başvuru Formu",
                        softWrap: true,
                      ),
                      Text(
                        "onaylandı.",
                      ),
                    ],
                  )
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      color: tobetoColor.cardColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "İstanbul Kodluyor Belge Yükleme",
                          softWrap: true,
                        ),
                        Text(
                          "Formu onaylandı.",
                          softWrap: true,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
