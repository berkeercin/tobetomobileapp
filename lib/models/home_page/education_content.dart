// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EducationContent {
  final String title;
  final String videoDuration;
  final String videoURL;
  final String videoId;
  final bool isFinished;
  EducationContent({
    required this.title,
    required this.videoDuration,
    required this.videoURL,
    required this.videoId,
    required this.isFinished,
  });

  EducationContent copyWith({
    String? title,
    String? videoDuration,
    String? videoURL,
    String? videoId,
    bool? isFinished,
  }) {
    return EducationContent(
      title: title ?? this.title,
      videoDuration: videoDuration ?? this.videoDuration,
      videoURL: videoURL ?? this.videoURL,
      videoId: videoId ?? this.videoId,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'videoDuration': videoDuration,
      'videoURL': videoURL,
      'videoId': videoId,
      'isFinished': isFinished,
    };
  }

  factory EducationContent.fromMap(Map<String, dynamic> map) {
    return EducationContent(
      title: map['title'] as String,
      videoDuration: map['videoDuration'] as String,
      videoURL: map['videoURL'] as String,
      videoId: map['videoId'] as String,
      isFinished: map['isFinished'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationContent.fromJson(String source) =>
      EducationContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EducationContent(title: $title, videoDuration: $videoDuration, videoURL: $videoURL, videoId: $videoId, isFinished: $isFinished)';
  }

  @override
  bool operator ==(covariant EducationContent other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.videoDuration == videoDuration &&
        other.videoURL == videoURL &&
        other.videoId == videoId &&
        other.isFinished == isFinished;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        videoDuration.hashCode ^
        videoURL.hashCode ^
        videoId.hashCode ^
        isFinished.hashCode;
  }
}
