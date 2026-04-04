// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  movieCount: (json['movie_count'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  pageNumber: (json['page_number'] as num?)?.toInt(),
  movies: (json['movies'] as List<dynamic>?)
      ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'movie_count': instance.movieCount,
  'limit': instance.limit,
  'page_number': instance.pageNumber,
  'movies': instance.movies,
};
