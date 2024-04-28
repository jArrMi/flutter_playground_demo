// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => Rocket(
      name: json['name'] as String,
      description: json['description'] as String,
      country: json['country'] as String,
      images: (json['flickr_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'country': instance.country,
      'flickr_images': instance.images,
    };
