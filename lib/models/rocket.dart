import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket {
  final String name;
  final String description;

  Rocket({
    required this.name,
    required this.description,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
}
