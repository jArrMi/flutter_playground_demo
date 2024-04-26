import 'package:json_annotation/json_annotation.dart';

part 'fairings.g.dart';

@JsonSerializable()
class Fairings {
  final bool? reused;
  final bool? recovery_attempt;
  final bool? recovered;
  final List<String> ships;

  Fairings({
    required this.reused,
    required this.recovery_attempt,
    required this.recovered,
    required this.ships,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) =>
      _$FairingsFromJson(json);

  Map<String, dynamic> toJson() => _$FairingsToJson(this);
}
