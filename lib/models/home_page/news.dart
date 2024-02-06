import 'dart:convert';

class News {
  final bool isNews;
  final String projectName;
  final String notifTitle;
  final String notifContent;
  final DateTime notifTime;
  final String notifId;
  News({
    required this.isNews,
    required this.projectName,
    required this.notifTitle,
    required this.notifContent,
    required this.notifTime,
    required this.notifId,
  });

  News copyWith({
    bool? isNews,
    String? projectName,
    String? notifTitle,
    String? notifContent,
    DateTime? notifTime,
    String? notifId,
  }) {
    return News(
      isNews: isNews ?? this.isNews,
      projectName: projectName ?? this.projectName,
      notifTitle: notifTitle ?? this.notifTitle,
      notifContent: notifContent ?? this.notifContent,
      notifTime: notifTime ?? this.notifTime,
      notifId: notifId ?? this.notifId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isNews': isNews});
    result.addAll({'projectName': projectName});
    result.addAll({'notifTitle': notifTitle});
    result.addAll({'notifContent': notifContent});
    result.addAll({'notifTime': notifTime.millisecondsSinceEpoch});
    result.addAll({'notifId': notifId});

    return result;
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      isNews: map['isNews'] ?? false,
      projectName: map['projectName'] ?? '',
      notifTitle: map['notifTitle'] ?? '',
      notifContent: map['notifContent'] ?? '',
      notifTime: DateTime.fromMillisecondsSinceEpoch(map['notifTime']),
      notifId: map['notifId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(isNews: $isNews, projectName: $projectName, notifTitle: $notifTitle, notifContent: $notifContent, notifTime: $notifTime, notifId: $notifId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.isNews == isNews &&
        other.projectName == projectName &&
        other.notifTitle == notifTitle &&
        other.notifContent == notifContent &&
        other.notifTime == notifTime &&
        other.notifId == notifId;
  }

  @override
  int get hashCode {
    return isNews.hashCode ^
        projectName.hashCode ^
        notifTitle.hashCode ^
        notifContent.hashCode ^
        notifTime.hashCode ^
        notifId.hashCode;
  }
}
