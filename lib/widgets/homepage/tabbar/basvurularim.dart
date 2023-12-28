import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/tobeto_colors.dart';

class Basvurularim extends StatelessWidget {
  const Basvurularim({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TobetoColor tobetoColor = TobetoColor();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: 180,
                              child: Text(
                                "İstanbul Kodluyor Bilgilendirme",
                                softWrap: true,
                              )),
                        ],
                      ),
                    ),
                    Card(
                        elevation: 7,
                        color: tobetoColor.cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            side: BorderSide(
                                width: 5, color: tobetoColor.cardColor)),
                        child: const Text(
                          " Kabul edildi. ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.check,
                    color: tobetoColor.cardColor,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Text(
                          "İstanbul Kodluyor Başvuru Formu onaylandı.",
                          softWrap: true,
                        ),
                      ),
                      // Text(
                      //   "",
                      // ),
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
                        Container(
                          width: 180,
                          child: const Text(
                            "İstanbul Kodluyor Belge Yükleme Formu onaylandı.",
                            softWrap: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
