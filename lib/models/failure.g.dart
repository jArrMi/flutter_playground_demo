// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      time: (json['time'] as num).toInt(),
      altitude: (json['altitude'] as num?)?.toInt(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };
