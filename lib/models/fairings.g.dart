// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fairings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fairings _$FairingsFromJson(Map<String, dynamic> json) => Fairings(
      reused: json['reused'] as bool?,
      recovery_attempt: json['recovery_attempt'] as bool?,
      recovered: json['recovered'] as bool?,
      ships: (json['ships'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FairingsToJson(Fairings instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recovery_attempt,
      'recovered': instance.recovered,
      'ships': instance.ships,
    };
