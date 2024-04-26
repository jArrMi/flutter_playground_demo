import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

@JsonSerializable()
class Core {
  final String core;
  final int flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landing_attempt;
  final bool? landing_success;
  final String? landing_type;
  final String? landpad;

  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landing_attempt,
    this.landing_success,
    this.landing_type,
    this.landpad,
  });

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);
  Map<String, dynamic> toJson() => _$CoreToJson(this);
}
