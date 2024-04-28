import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable()
class Launchpad {
  final String name;
  final String fullName;

  Launchpad({
    required this.name,
    required this.fullName,
  });

  factory Launchpad.fromJson(Map<String, dynamic> json) => _$LaunchpadFromJson(json);
}
