// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => Launchpad(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      image: Launchpad._imageFromJson(json, 'images') as String,
      locality: json['locality'] as String,
      region: json['region'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      details: json['details'] as String,
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'images': instance.image,
      'locality': instance.locality,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'details': instance.details,
    };
