import 'dart:convert';

class UserData {
  final String id;
  final String name;
  final String surname;
  UserData({
    required this.id,
    required this.name,
    required this.surname,
  });

  UserData copyWith({
    String? id,
    String? name,
    String? surname,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'surname': surname});

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() => 'UserData(id: $id, name: $name, surname: $surname)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.id == id &&
        other.name == name &&
        other.surname == surname;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ surname.hashCode;
}
