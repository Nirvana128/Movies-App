// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMoviesModel _$NewMoviesModelFromJson(Map<String, dynamic> json) =>
    NewMoviesModel(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['@meta'] == null
          ? null
          : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewMoviesModelToJson(NewMoviesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
      '@meta': instance.meta,
    };
