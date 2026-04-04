// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  apiVersion: (json['api_version'] as num?)?.toInt(),
  executionTime: json['execution_time'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'api_version': instance.apiVersion,
  'execution_time': instance.executionTime,
};
