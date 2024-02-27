import 'package:flutter/material.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';

class SurveysTab extends StatelessWidget {
  const SurveysTab({super.key, required this.surveyList});
  final List<Survey> surveyList;

  Widget noSurveyFound(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            "assets/images/no-survey-found.png",
            height: 250,
          ),
          const Text(
            "Atanmış herhangi bir anketiniz bulunmamaktadır",
            softWrap: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: surveyList.isEmpty
            ? [noSurveyFound(context)]
            : surveyList.map((s) {
                return loadSurvey(context, s);
              }).toList(),
      ),
    );
  }

  Widget loadSurvey(BuildContext context, Survey survey) {
    return const Column(
      children: [],
    );
  }
}
