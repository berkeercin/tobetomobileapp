// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogItem {
  final String duration;
  final String title;
  final String imgURL;
  final String category;
  final String eduType;
  final String eduLevel;
  final String eduTopic;
  final String softwareLang;
  final String instructor;
  final String status;
  CatalogItem({
    required this.duration,
    required this.title,
    required this.imgURL,
    required this.category,
    required this.eduType,
    required this.eduLevel,
    required this.eduTopic,
    required this.softwareLang,
    required this.instructor,
    required this.status,
  });

  CatalogItem copyWith({
    String? duration,
    String? title,
    String? imgURL,
    String? category,
    String? eduType,
    String? eduLevel,
    String? eduTopic,
    String? softwareLang,
    String? instructor,
    String? status,
  }) {
    return CatalogItem(
      duration: duration ?? this.duration,
      title: title ?? this.title,
      imgURL: imgURL ?? this.imgURL,
      category: category ?? this.category,
      eduType: eduType ?? this.eduType,
      eduLevel: eduLevel ?? this.eduLevel,
      eduTopic: eduTopic ?? this.eduTopic,
      softwareLang: softwareLang ?? this.softwareLang,
      instructor: instructor ?? this.instructor,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'duration': duration,
      'title': title,
      'imgURL': imgURL,
      'category': category,
      'eduType': eduType,
      'eduLevel': eduLevel,
      'eduTopic': eduTopic,
      'softwareLang': softwareLang,
      'instructor': instructor,
      'status': status,
    };
  }

  factory CatalogItem.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return CatalogItem(
      duration: map['duration'] as String,
      title: map['title'] as String,
      imgURL: map['imgURL'] as String,
      category: map['category'] as String,
      eduType: map['eduType'] as String,
      eduLevel: map['eduLevel'] as String,
      eduTopic: map['eduTopic'] as String,
      softwareLang: map['softwareLang'] as String,
      instructor: map['instructor'] as String,
      status: map['status'] as String,
    );
  }

  factory CatalogItem.fromMap(Map<String, dynamic> map) {
    return CatalogItem(
      duration: map['duration'] as String,
      title: map['title'] as String,
      imgURL: map['imgURL'] as String,
      category: map['category'] as String,
      eduType: map['eduType'] as String,
      eduLevel: map['eduLevel'] as String,
      eduTopic: map['eduTopic'] as String,
      softwareLang: map['softwareLang'] as String,
      instructor: map['instructor'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogItem.fromJson(String source) =>
      CatalogItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatalogItem(duration: $duration, title: $title, imgURL: $imgURL, category: $category, eduType: $eduType, eduLevel: $eduLevel, eduTopic: $eduTopic, softwareLang: $softwareLang, instructor: $instructor, status: $status)';
  }

  @override
  bool operator ==(covariant CatalogItem other) {
    if (identical(this, other)) return true;

    return other.duration == duration &&
        other.title == title &&
        other.imgURL == imgURL &&
        other.category == category &&
        other.eduType == eduType &&
        other.eduLevel == eduLevel &&
        other.eduTopic == eduTopic &&
        other.softwareLang == softwareLang &&
        other.instructor == instructor &&
        other.status == status;
  }

  @override
  int get hashCode {
    return duration.hashCode ^
        title.hashCode ^
        imgURL.hashCode ^
        category.hashCode ^
        eduType.hashCode ^
        eduLevel.hashCode ^
        eduTopic.hashCode ^
        softwareLang.hashCode ^
        instructor.hashCode ^
        status.hashCode;
  }
}



// class CatalogItem {
//   final String author;
//   final String duration;
//   final String title;
//   final String imgURL;
//   CatalogItem({
//     required this.author,
//     required this.duration,
//     required this.title,
//     required this.imgURL,
//   });

//   CatalogItem copyWith({
//     String? author,
//     String? duration,
//     String? title,
//     String? imgURL,
//   }) {
//     return CatalogItem(
//       author: author ?? this.author,
//       duration: duration ?? this.duration,
//       title: title ?? this.title,
//       imgURL: imgURL ?? this.imgURL,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'author': author,
//       'duration': duration,
//       'title': title,
//       'imgURL': imgURL,
//     };
//   }

//   factory CatalogItem.fromMap(Map<String, dynamic> map) {
//     return CatalogItem(
//       author: map['author'] as String,
//       duration: map['duration'] as String,
//       title: map['title'] as String,
//       imgURL: map['imgURL'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CatalogItem.fromJson(String source) =>
//       CatalogItem.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'CatalogItem(author: $author, duration: $duration, title: $title, imgURL: $imgURL)';
//   }

//   @override
//   bool operator ==(covariant CatalogItem other) {
//     if (identical(this, other)) return true;

//     return other.author == author &&
//         other.duration == duration &&
//         other.title == title &&
//         other.imgURL == imgURL;
//   }

//   @override
//   int get hashCode {
//     return author.hashCode ^
//         duration.hashCode ^
//         title.hashCode ^
//         imgURL.hashCode;
//   }
// }
