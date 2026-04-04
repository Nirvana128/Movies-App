import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	@JsonKey(name: 'movie_count') 
	final int? movieCount;
	final int? limit;
	@JsonKey(name: 'page_number') 
	final int? pageNumber;
	final List<Movie>? movies;

	const Data({this.movieCount, this.limit, this.pageNumber, this.movies});

	@override
	String toString() {
		return 'Data(movieCount: $movieCount, limit: $limit, pageNumber: $pageNumber, movies: $movies)';
	}

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);

	Data copyWith({
		int? movieCount,
		int? limit,
		int? pageNumber,
		List<Movie>? movies,
	}) {
		return Data(
			movieCount: movieCount ?? this.movieCount,
			limit: limit ?? this.limit,
			pageNumber: pageNumber ?? this.pageNumber,
			movies: movies ?? this.movies,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Data) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			movieCount.hashCode ^
			limit.hashCode ^
			pageNumber.hashCode ^
			movies.hashCode;
}
