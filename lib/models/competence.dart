import 'dart:convert';

class Competence {
  final String competenceName;
  final String competenceScore;
  final DateTime competenceDate;
  Competence({
    required this.competenceName,
    required this.competenceScore,
    required this.competenceDate,
  });

  Competence copyWith({
    String? competenceName,
    String? competenceScore,
    DateTime? competenceDate,
  }) {
    return Competence(
      competenceName: competenceName ?? this.competenceName,
      competenceScore: competenceScore ?? this.competenceScore,
      competenceDate: competenceDate ?? this.competenceDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'competenceName': competenceName});
    result.addAll({'competenceScore': competenceScore});
    result.addAll({'competenceDate': competenceDate.millisecondsSinceEpoch});

    return result;
  }

  factory Competence.fromMap(Map<String, dynamic> map) {
    return Competence(
      competenceName: map['competenceName'] ?? '',
      competenceScore: map['competenceScore'] ?? '',
      competenceDate:
          DateTime.fromMillisecondsSinceEpoch(map['competenceDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Competence.fromJson(String source) =>
      Competence.fromMap(json.decode(source));

  @override
  String toString() =>
      'Competence(competenceName: $competenceName, competenceScore: $competenceScore, competenceDate: $competenceDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Competence &&
        other.competenceName == competenceName &&
        other.competenceScore == competenceScore &&
        other.competenceDate == competenceDate;
  }

  @override
  int get hashCode =>
      competenceName.hashCode ^
      competenceScore.hashCode ^
      competenceDate.hashCode;
}
