import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  final Patch patch;
  final Reddit reddit;
  final Flickr flickr;
  final String? presskit;
  final String? webcast;
  final String? youtube_id;
  final String? article;
  final String? wikipedia;

  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    this.presskit,
    required this.webcast,
    required this.youtube_id,
    required this.article,
    required this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Patch {
  final String small;
  final String large;

  Patch({
    required this.small,
    required this.large,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchToJson(this);
}

@JsonSerializable()
class Reddit {
  final String? campaign;
  final String? launch;
  final String? media;
  final String? recovery;

  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  factory Reddit.fromJson(Map<String, dynamic> json) => _$RedditFromJson(json);

  Map<String, dynamic> toJson() => _$RedditToJson(this);
}

@JsonSerializable()
class Flickr {
  final List<String> small;
  final List<String> original;

  Flickr({
    required this.small,
    required this.original,
  });

  factory Flickr.fromJson(Map<String, dynamic> json) => _$FlickrFromJson(json);

  Map<String, dynamic> toJson() => _$FlickrToJson(this);
}
