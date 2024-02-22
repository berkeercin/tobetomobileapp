// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tobetomobileapp/models/home_page/education_content.dart';

class EducationContentList {
  final String contentTitle;
  final String contentId;
  final bool isModule;
  final bool isFinished;
  final List<EducationContent> subContent;
  EducationContentList({
    required this.contentTitle,
    required this.contentId,
    required this.isModule,
    required this.isFinished,
    required this.subContent,
  });

  EducationContentList copyWith({
    String? contentTitle,
    String? contentId,
    bool? isModule,
    bool? isFinished,
    List<EducationContent>? subContent,
  }) {
    return EducationContentList(
      contentTitle: contentTitle ?? this.contentTitle,
      contentId: contentId ?? this.contentId,
      isModule: isModule ?? this.isModule,
      isFinished: isFinished ?? this.isFinished,
      subContent: subContent ?? this.subContent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contentTitle': contentTitle,
      'contentId': contentId,
      'isModule': isModule,
      'isFinished': isFinished,
      'subContent': subContent.map((x) => x.toMap()).toList(),
    };
  }

  factory EducationContentList.fromMap(Map<String, dynamic> map) {
    return EducationContentList(
      contentTitle: map['contentTitle'] as String,
      contentId: map['contentId'] as String,
      isModule: map['isModule'] as bool,
      isFinished: map['isFinished'] as bool,
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
  String toString() {
    return 'EducationContentList(contentTitle: $contentTitle, contentId: $contentId, isModule: $isModule, isFinished: $isFinished, subContent: $subContent)';
  }

  @override
  bool operator ==(covariant EducationContentList other) {
    if (identical(this, other)) return true;

    return other.contentTitle == contentTitle &&
        other.contentId == contentId &&
        other.isModule == isModule &&
        other.isFinished == isFinished &&
        listEquals(other.subContent, subContent);
  }

  @override
  int get hashCode {
    return contentTitle.hashCode ^
        contentId.hashCode ^
        isModule.hashCode ^
        isFinished.hashCode ^
        subContent.hashCode;
  }
}
