// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      fairings: _fairingsFromJson(json['fairings'] as Map<String, dynamic>?),
      links: _linksFromJson(json['links'] as Map<String, dynamic>),
      static_fire_date_utc: json['static_fire_date_utc'] as String?,
      static_fire_date_unix: (json['static_fire_date_unix'] as num?)?.toInt(),
      net: json['net'] as bool,
      window: (json['window'] as num?)?.toInt(),
      rocket: json['rocket'] as String,
      success: json['success'] as bool?,
      failures: _failuresFromJson(json['failures'] as List),
      details: json['details'] as String?,
      crew: _crewsFromJson(json['crew'] as List),
      ships: (json['ships'] as List<dynamic>).map((e) => e as String).toList(),
      capsules:
          (json['capsules'] as List<dynamic>).map((e) => e as String).toList(),
      payloads:
          (json['payloads'] as List<dynamic>).map((e) => e as String).toList(),
      launchpad: json['launchpad'] as String,
      flight_number: (json['flight_number'] as num).toInt(),
      name: json['name'] as String,
      date_utc: json['date_utc'] as String,
      date_unix: (json['date_unix'] as num).toInt(),
      date_local: json['date_local'] as String,
      date_precision: json['date_precision'] as String,
      upcoming: json['upcoming'] as bool,
      cores: _coresFromJson(json['cores'] as List),
      auto_update: json['auto_update'] as bool,
      tbd: json['tbd'] as bool,
      launch_library_id: json['launch_library_id'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'fairings': _fairingsToJson(instance.fairings),
      'links': _linksToJson(instance.links),
      'static_fire_date_utc': instance.static_fire_date_utc,
      'static_fire_date_unix': instance.static_fire_date_unix,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': _failuresToJson(instance.failures),
      'details': instance.details,
      'crew': _crewsToJson(instance.crew),
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'flight_number': instance.flight_number,
      'name': instance.name,
      'date_utc': instance.date_utc,
      'date_unix': instance.date_unix,
      'date_local': instance.date_local,
      'date_precision': instance.date_precision,
      'upcoming': instance.upcoming,
      'cores': _coresToJson(instance.cores),
      'auto_update': instance.auto_update,
      'tbd': instance.tbd,
      'launch_library_id': instance.launch_library_id,
      'id': instance.id,
    };
