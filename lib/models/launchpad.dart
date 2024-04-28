import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable()
class Launchpad {
  final String name;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "images", readValue: _imageFromJson)
  final String image;
  final String locality;
  final String region;
  final double latitude;
  final double longitude;
  final String details;

  Launchpad({
    required this.name,
    required this.fullName,
    required this.image,
    required this.locality,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.details,
  });

  factory Launchpad.fromJson(Map<String, dynamic> json) => _$LaunchpadFromJson(json);

  static String _imageFromJson(Map<dynamic, dynamic> images, String key) {
    return (images['images']['large'] as List<dynamic>).first.toString();
  }
}
