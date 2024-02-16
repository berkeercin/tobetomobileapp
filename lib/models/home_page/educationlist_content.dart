// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tobetomobileapp/models/home_page/education_content.dart';

class EducationContentList {
  final String contentTitle;
  final bool isModule;
  final List<EducationContent> subContent;
  EducationContentList({
    required this.contentTitle,
    required this.isModule,
    required this.subContent,
  });

  EducationContentList copyWith({
    String? contentTitle,
    bool? isModule,
    List<EducationContent>? subContent,
  }) {
    return EducationContentList(
      contentTitle: contentTitle ?? this.contentTitle,
      isModule: isModule ?? this.isModule,
      subContent: subContent ?? this.subContent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contentTitle': contentTitle,
      'isModule': isModule,
      'subContent': subContent.map((x) => x.toMap()).toList(),
    };
  }

  factory EducationContentList.fromMap(Map<String, dynamic> map) {
    return EducationContentList(
      contentTitle: map['contentTitle'] as String,
      isModule: map['isModule'] as bool,
      subContent: List<EducationContent>.from(
        (map['subContent'] as List<int>).map<EducationContent>(
          (x) => EducationContent.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationContentList.fromJson(String source) =>
      EducationContentList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'EducationContent(contentTitle: $contentTitle, isModule: $isModule, subContent: $subContent)';

  @override
  bool operator ==(covariant EducationContentList other) {
    if (identical(this, other)) return true;

    return other.contentTitle == contentTitle &&
        other.isModule == isModule &&
        listEquals(other.subContent, subContent);
  }

  @override
  int get hashCode =>
      contentTitle.hashCode ^ isModule.hashCode ^ subContent.hashCode;
}
