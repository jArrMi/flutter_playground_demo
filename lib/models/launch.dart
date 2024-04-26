import 'package:flutter_playrground_1/models/crew.dart';
import 'package:json_annotation/json_annotation.dart';

import 'core.dart';
import 'failure.dart';
import 'fairings.dart';
import 'links.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  @JsonKey(fromJson: _fairingsFromJson, toJson: _fairingsToJson)
  final Fairings? fairings;

  @JsonKey(fromJson: _linksFromJson, toJson: _linksToJson)
  final Links links;

  final String? static_fire_date_utc;
  final int? static_fire_date_unix;
  final bool net;
  final int? window;
  final String rocket;
  final bool? success;

  @JsonKey(fromJson: _failuresFromJson, toJson: _failuresToJson)
  final List<Failure> failures;
  final String? details;

  @JsonKey(fromJson: _crewsFromJson, toJson: _crewsToJson)
  final List<Crew> crew;
  final List<String> ships;
  final List<String> capsules;
  final List<String> payloads;
  final String launchpad;
  final int flight_number;
  final String name;
  final String date_utc;
  final int date_unix;
  final String date_local;
  final String date_precision;
  final bool upcoming;

  @JsonKey(fromJson: _coresFromJson, toJson: _coresToJson)
  final List<Core> cores;
  final bool auto_update;
  final bool tbd;
  final String? launch_library_id;
  final String id;

  Launch({
    required this.fairings,
    required this.links,
    required this.static_fire_date_utc,
    required this.static_fire_date_unix,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.failures,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.flight_number,
    required this.name,
    required this.date_utc,
    required this.date_unix,
    required this.date_local,
    required this.date_precision,
    required this.upcoming,
    required this.cores,
    required this.auto_update,
    required this.tbd,
    required this.launch_library_id,
    required this.id,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

Fairings? _fairingsFromJson(Map<String, dynamic>? json) {
  if (json != null) {
    return Fairings.fromJson(json);
  } else {
    return null;
  }
}

Map<String, dynamic>? _fairingsToJson(Fairings? instance) {
  if (instance != null) {
    return instance.toJson();
  } else {
    return null;
  }
}

Links _linksFromJson(Map<String, dynamic> json) {
  return Links.fromJson(json);
}

Map<String, dynamic> _linksToJson(Links instance) {
  return instance.toJson();
}

List<Failure> _failuresFromJson(List<dynamic> json) {
  return json.map((e) => Failure.fromJson(e as Map<String, dynamic>)).toList();
}

List<Map<String, dynamic>> _failuresToJson(List<Failure> instance) {
  return instance.map((e) => e.toJson()).toList();
}

List<Core> _coresFromJson(List<dynamic> json) {
  return json.map((e) => Core.fromJson(e as Map<String, dynamic>)).toList();
}

List<Map<String, dynamic>> _coresToJson(List<Core> instance) {
  return instance.map((e) => e.toJson()).toList();
}

List<Crew> _crewsFromJson(List<dynamic> json) {
  return json.map((e) => Crew.fromJson(e as Map<String, dynamic>)).toList();
}

List<Map<String, dynamic>> _crewsToJson(List<Crew> instance) {
  return instance.map((e) => e.toJson()).toList();
}
