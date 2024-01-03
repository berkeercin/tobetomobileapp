import 'package:flutter/material.dart';
import 'package:tobetomobileapp/dummydata/survey_list.dart';

class Anketlerim extends StatelessWidget {
  const Anketlerim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 400,
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: surveyList.length + 1,
              itemBuilder: (context, index) {
                if (surveyList.isEmpty) {
                  return Column(
                    children: [
                      Image.asset(
                        "assets/images/no-survey-found.png",
                        height: 250,
                      ),
                      Text(
                        "Atanmış herhangi bir anketiniz bulunmamaktadır",
                        softWrap: true,
                      )
                    ],
                  );
                } else if (index < surveyList.length) {
                  return Column(
                    children: [],
                  );
                } else {
                  return Container();
                }
              },
            )),
      ),
    );
  }
}
