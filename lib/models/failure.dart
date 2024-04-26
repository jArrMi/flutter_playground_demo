import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()
class Failure {
  final int time;
  final int? altitude;
  final String reason;

  Failure({
    required this.time,
    this.altitude,
    required this.reason,
  });

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);
  Map<String, dynamic> toJson() => _$FailureToJson(this);
}
