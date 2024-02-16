// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';

class PageContent {
  final List<Application> applicationList;
  final List<News> newsList;
  final List<Survey> surveyList;
  final List<Education> educationList;
  PageContent({
    required this.applicationList,
    required this.newsList,
    required this.surveyList,
    required this.educationList,
  });

  PageContent copyWith({
    List<Application>? applicationList,
    List<News>? newsList,
    List<Survey>? surveyList,
    List<Education>? educationList,
  }) {
    return PageContent(
      applicationList: applicationList ?? this.applicationList,
      newsList: newsList ?? this.newsList,
      surveyList: surveyList ?? this.surveyList,
      educationList: educationList ?? this.educationList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'applicationList': applicationList.map((x) => x.toMap()).toList(),
      'newsList': newsList.map((x) => x.toMap()).toList(),
      'surveyList': surveyList.map((x) => x.toMap()).toList(),
      'educationList': educationList.map((x) => x.toMap()).toList(),
    };
  }

  factory PageContent.fromMap(Map<String, dynamic> map) {
    return PageContent(
      applicationList: List<Application>.from(
        (map['applicationList'] as List<int>).map<Application>(
          (x) => Application.fromMap(x as Map<String, dynamic>),
        ),
      ),
      newsList: List<News>.from(
        (map['newsList'] as List<int>).map<News>(
          (x) => News.fromMap(x as Map<String, dynamic>),
        ),
      ),
      surveyList: List<Survey>.from(
        (map['surveyList'] as List<int>).map<Survey>(
          (x) => Survey.fromMap(x as Map<String, dynamic>),
        ),
      ),
      educationList: List<Education>.from(
        (map['educationList'] as List<int>).map<Education>(
          (x) => Education.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PageContent.fromJson(String source) =>
      PageContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PageContent(applicationList: $applicationList, newsList: $newsList, surveyList: $surveyList, educationList: $educationList)';
  }

  @override
  bool operator ==(covariant PageContent other) {
    if (identical(this, other)) return true;

    return listEquals(other.applicationList, applicationList) &&
        listEquals(other.newsList, newsList) &&
        listEquals(other.surveyList, surveyList) &&
        listEquals(other.educationList, educationList);
  }

  @override
  int get hashCode {
    return applicationList.hashCode ^
        newsList.hashCode ^
        surveyList.hashCode ^
        educationList.hashCode;
  }
}
