import 'package:flutter_playrground_1/utils/string_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket {
  final String name;
  final String description;
  final String country;
  @JsonKey(name: "flickr_images", defaultValue: [])
  final List<String> images;

  Rocket({
    required this.name,
    required this.description,
    required this.country,
    required this.images,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
}

extension ImgurImageLink on String {
  String imgurThumbnail() {
    if (contains("imgur")) {
      return addCharAtPosition("i.", 7).addCharAtPosition(".jpeg", length);
    } else {
      return this;
    }
  }
}
