import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String id;
  String name;
  String surname;
  String username;
  String email;
  String? biography;
  UserData({
    required this.id,
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    this.biography,
  });

  UserData copyWith({
    String? id,
    String? name,
    String? surname,
    String? username,
    String? email,
    String? biography,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      email: email ?? this.email,
      biography: biography ?? this.biography,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'username': username});
    result.addAll({'email': email});
    if (biography != null) {
      result.addAll({'biography': biography});
    }

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      biography: map['biography'],
    );
  }

  factory UserData.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return UserData(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      biography: map['biography'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, surname: $surname, username: $username, email: $email, biography: $biography)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.id == id &&
        other.name == name &&
        other.surname == surname &&
        other.username == username &&
        other.email == email &&
        other.biography == biography;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        username.hashCode ^
        email.hashCode ^
        biography.hashCode;
  }
}
