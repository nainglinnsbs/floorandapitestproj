import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  final String name;
  Person({required this.name});

  @override
  String toString() => 'Person(name: $name)';

  Person copyWith({
    String? name,
  }) {
    return Person(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
