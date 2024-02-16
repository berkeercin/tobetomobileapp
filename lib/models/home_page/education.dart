// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tobetomobileapp/models/home_page/educationlist_content.dart';

class Education {
  final String eduTitle;
  final String eduId;
  final String eduThumbnailUrl;
  final DateTime startDate;
  final DateTime endDate;
  final List<EducationContentList> content;
  final bool isActive;
  final bool isFinished;
  Education({
    required this.eduTitle,
    required this.eduId,
    required this.eduThumbnailUrl,
    required this.startDate,
    required this.endDate,
    required this.content,
    required this.isActive,
    required this.isFinished,
  });

  Education copyWith({
    String? eduTitle,
    String? eduId,
    String? eduThumbnailUrl,
    DateTime? startDate,
    DateTime? endDate,
    List<EducationContentList>? content,
    bool? isActive,
    bool? isFinished,
  }) {
    return Education(
      eduTitle: eduTitle ?? this.eduTitle,
      eduId: eduId ?? this.eduId,
      eduThumbnailUrl: eduThumbnailUrl ?? this.eduThumbnailUrl,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      content: content ?? this.content,
      isActive: isActive ?? this.isActive,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eduTitle': eduTitle,
      'eduId': eduId,
      'eduThumbnailUrl': eduThumbnailUrl,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'content': content.map((x) => x.toMap()).toList(),
      'isActive': isActive,
      'isFinished': isFinished,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      eduTitle: map['eduTitle'] as String,
      eduId: map['eduId'] as String,
      eduThumbnailUrl: map['eduThumbnailUrl'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      content: List<EducationContentList>.from(
        (map['content'] as List<int>).map<EducationContentList>(
          (x) => EducationContentList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isActive: map['isActive'] as bool,
      isFinished: map['isFinished'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(eduTitle: $eduTitle, eduId: $eduId, eduThumbnailUrl: $eduThumbnailUrl, startDate: $startDate, endDate: $endDate, content: $content, isActive: $isActive, isFinished: $isFinished)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;

    return other.eduTitle == eduTitle &&
        other.eduId == eduId &&
        other.eduThumbnailUrl == eduThumbnailUrl &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        listEquals(other.content, content) &&
        other.isActive == isActive &&
        other.isFinished == isFinished;
  }

  @override
  int get hashCode {
    return eduTitle.hashCode ^
        eduId.hashCode ^
        eduThumbnailUrl.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        content.hashCode ^
        isActive.hashCode ^
        isFinished.hashCode;
  }
}


// class Education {
//   const Education({
//     required this.videoName,
//     required this.videoId,
//     required this.videoThumbnail,
//     required this.videoDate,
//   });
//   final String videoName;
//   final String videoId;
//   final String videoThumbnail;
//   final DateTime videoDate;

//   Education copyWith({
//     String? videoName,
//     String? videoId,
//     String? videoThumbnail,
//     DateTime? videoDate,
//   }) {
//     return Education(
//       videoName: videoName ?? this.videoName,
//       videoId: videoId ?? this.videoId,
//       videoThumbnail: videoThumbnail ?? this.videoThumbnail,
//       videoDate: videoDate ?? this.videoDate,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'videoName': videoName});
//     result.addAll({'videoId': videoId});
//     result.addAll({'videoThumbnail': videoThumbnail});
//     result.addAll({'videoDate': videoDate.millisecondsSinceEpoch});

//     return result;
//   }

//   factory Education.fromMap(Map<String, dynamic> map) {
//     return Education(
//       videoName: map['videoName'] ?? '',
//       videoId: map['videoId'] ?? '',
//       videoThumbnail: map['videoThumbnail'] ?? '',
//       videoDate: DateTime.fromMillisecondsSinceEpoch(map['videoDate']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Education.fromJson(String source) =>
//       Education.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Video(videoName: $videoName, videoId: $videoId, videoThumbnail: $videoThumbnail, videoDate: $videoDate)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Education &&
//         other.videoName == videoName &&
//         other.videoId == videoId &&
//         other.videoThumbnail == videoThumbnail &&
//         other.videoDate == videoDate;
//   }

//   @override
//   int get hashCode {
//     return videoName.hashCode ^
//         videoId.hashCode ^
//         videoThumbnail.hashCode ^
//         videoDate.hashCode;
//   }
// }
