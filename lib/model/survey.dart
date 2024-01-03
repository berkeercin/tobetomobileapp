import 'dart:convert';

class Survey {
  final String surveyName;
  final String surveyDate;
  final String surveyPageId;
  Survey({
    required this.surveyName,
    required this.surveyDate,
    required this.surveyPageId,
  });

  Survey copyWith({
    String? surveyName,
    String? surveyDate,
    String? surveyPageId,
  }) {
    return Survey(
      surveyName: surveyName ?? this.surveyName,
      surveyDate: surveyDate ?? this.surveyDate,
      surveyPageId: surveyPageId ?? this.surveyPageId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'surveyName': surveyName});
    result.addAll({'surveyDate': surveyDate});
    result.addAll({'surveyPageId': surveyPageId});

    return result;
  }

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      surveyName: map['surveyName'] ?? '',
      surveyDate: map['surveyDate'] ?? '',
      surveyPageId: map['surveyPageId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Survey.fromJson(String source) => Survey.fromMap(json.decode(source));

  @override
  String toString() =>
      'Survey(surveyName: $surveyName, surveyDate: $surveyDate, surveyPageId: $surveyPageId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Survey &&
        other.surveyName == surveyName &&
        other.surveyDate == surveyDate &&
        other.surveyPageId == surveyPageId;
  }

  @override
  int get hashCode =>
      surveyName.hashCode ^ surveyDate.hashCode ^ surveyPageId.hashCode;
}
