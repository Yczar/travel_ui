import 'dart:convert';

import 'package:equatable/equatable.dart';

class Onboarding extends Equatable {
  final String title;
  final String description;
  const Onboarding({
    required this.title,
    required this.description,
  });

  Onboarding copyWith({
    String? title,
    String? description,
  }) {
    return Onboarding(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory Onboarding.fromMap(Map<String, dynamic> map) {
    return Onboarding(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Onboarding.fromJson(String source) =>
      Onboarding.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, description];
}
