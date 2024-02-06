// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Application {
  final String applicationTitle;
  final int applicationStatus;
  final List<Map> subAppliactionList;
  Application({
    required this.applicationTitle,
    required this.applicationStatus,
    required this.subAppliactionList,
  });

  Application copyWith({
    String? applicationTitle,
    int? applicationStatus,
    List<Map>? appliactionList,
  }) {
    return Application(
      applicationTitle: applicationTitle ?? this.applicationTitle,
      applicationStatus: applicationStatus ?? this.applicationStatus,
      subAppliactionList: appliactionList ?? this.subAppliactionList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'applicationTitle': applicationTitle,
      'applicationStatus': applicationStatus,
      'appliactionList': subAppliactionList,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      applicationTitle: map['applicationTitle'] as String,
      applicationStatus: map['applicationStatus'] as int,
      subAppliactionList: List<Map>.from(
        (map['appliactionList'] as List<Map>).map<Map>(
          (x) => x,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Application(applicationTitle: $applicationTitle, applicationStatus: $applicationStatus, appliactionList: $subAppliactionList)';

  @override
  bool operator ==(covariant Application other) {
    if (identical(this, other)) return true;

    return other.applicationTitle == applicationTitle &&
        other.applicationStatus == applicationStatus &&
        listEquals(other.subAppliactionList, subAppliactionList);
  }

  @override
  int get hashCode =>
      applicationTitle.hashCode ^
      applicationStatus.hashCode ^
      subAppliactionList.hashCode;
}
