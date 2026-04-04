import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'torrent.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
	final int? id;
	final String? url;
	@JsonKey(name: 'imdb_code') 
	final String? imdbCode;
	final String? title;
	@JsonKey(name: 'title_english') 
	final String? titleEnglish;
	@JsonKey(name: 'title_long') 
	final String? titleLong;
	final String? slug;
	final int? year;
	final double? rating;
	final int? runtime;
	final List<String>? genres;
	final String? summary;
	@JsonKey(name: 'description_full') 
	final String? descriptionFull;
	final String? synopsis;
	@JsonKey(name: 'yt_trailer_code') 
	final String? ytTrailerCode;
	final String? language;
	@JsonKey(name: 'mpa_rating') 
	final String? mpaRating;
	@JsonKey(name: 'background_image') 
	final String? backgroundImage;
	@JsonKey(name: 'background_image_original') 
	final String? backgroundImageOriginal;
	@JsonKey(name: 'small_cover_image') 
	final String? smallCoverImage;
	@JsonKey(name: 'medium_cover_image') 
	final String? mediumCoverImage;
	@JsonKey(name: 'large_cover_image') 
	final String? largeCoverImage;
	final String? state;
	final List<Torrent>? torrents;
	@JsonKey(name: 'date_uploaded') 
	final String? dateUploaded;
	@JsonKey(name: 'date_uploaded_unix') 
	final int? dateUploadedUnix;

	const Movie({
		this.id, 
		this.url, 
		this.imdbCode, 
		this.title, 
		this.titleEnglish, 
		this.titleLong, 
		this.slug, 
		this.year, 
		this.rating, 
		this.runtime, 
		this.genres, 
		this.summary, 
		this.descriptionFull, 
		this.synopsis, 
		this.ytTrailerCode, 
		this.language, 
		this.mpaRating, 
		this.backgroundImage, 
		this.backgroundImageOriginal, 
		this.smallCoverImage, 
		this.mediumCoverImage, 
		this.largeCoverImage, 
		this.state, 
		this.torrents, 
		this.dateUploaded, 
		this.dateUploadedUnix, 
	});

	@override
	String toString() {
		return 'Movie(id: $id, url: $url, imdbCode: $imdbCode, title: $title, titleEnglish: $titleEnglish, titleLong: $titleLong, slug: $slug, year: $year, rating: $rating, runtime: $runtime, genres: $genres, summary: $summary, descriptionFull: $descriptionFull, synopsis: $synopsis, ytTrailerCode: $ytTrailerCode, language: $language, mpaRating: $mpaRating, backgroundImage: $backgroundImage, backgroundImageOriginal: $backgroundImageOriginal, smallCoverImage: $smallCoverImage, mediumCoverImage: $mediumCoverImage, largeCoverImage: $largeCoverImage, state: $state, torrents: $torrents, dateUploaded: $dateUploaded, dateUploadedUnix: $dateUploadedUnix)';
	}

	factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

	Map<String, dynamic> toJson() => _$MovieToJson(this);

	Movie copyWith({
		int? id,
		String? url,
		String? imdbCode,
		String? title,
		String? titleEnglish,
		String? titleLong,
		String? slug,
		int? year,
		double? rating,
		int? runtime,
		List<String>? genres,
		String? summary,
		String? descriptionFull,
		String? synopsis,
		String? ytTrailerCode,
		String? language,
		String? mpaRating,
		String? backgroundImage,
		String? backgroundImageOriginal,
		String? smallCoverImage,
		String? mediumCoverImage,
		String? largeCoverImage,
		String? state,
		List<Torrent>? torrents,
		String? dateUploaded,
		int? dateUploadedUnix,
	}) {
		return Movie(
			id: id ?? this.id,
			url: url ?? this.url,
			imdbCode: imdbCode ?? this.imdbCode,
			title: title ?? this.title,
			titleEnglish: titleEnglish ?? this.titleEnglish,
			titleLong: titleLong ?? this.titleLong,
			slug: slug ?? this.slug,
			year: year ?? this.year,
			rating: rating ?? this.rating,
			runtime: runtime ?? this.runtime,
			genres: genres ?? this.genres,
			summary: summary ?? this.summary,
			descriptionFull: descriptionFull ?? this.descriptionFull,
			synopsis: synopsis ?? this.synopsis,
			ytTrailerCode: ytTrailerCode ?? this.ytTrailerCode,
			language: language ?? this.language,
			mpaRating: mpaRating ?? this.mpaRating,
			backgroundImage: backgroundImage ?? this.backgroundImage,
			backgroundImageOriginal: backgroundImageOriginal ?? this.backgroundImageOriginal,
			smallCoverImage: smallCoverImage ?? this.smallCoverImage,
			mediumCoverImage: mediumCoverImage ?? this.mediumCoverImage,
			largeCoverImage: largeCoverImage ?? this.largeCoverImage,
			state: state ?? this.state,
			torrents: torrents ?? this.torrents,
			dateUploaded: dateUploaded ?? this.dateUploaded,
			dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Movie) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			url.hashCode ^
			imdbCode.hashCode ^
			title.hashCode ^
			titleEnglish.hashCode ^
			titleLong.hashCode ^
			slug.hashCode ^
			year.hashCode ^
			rating.hashCode ^
			runtime.hashCode ^
			genres.hashCode ^
			summary.hashCode ^
			descriptionFull.hashCode ^
			synopsis.hashCode ^
			ytTrailerCode.hashCode ^
			language.hashCode ^
			mpaRating.hashCode ^
			backgroundImage.hashCode ^
			backgroundImageOriginal.hashCode ^
			smallCoverImage.hashCode ^
			mediumCoverImage.hashCode ^
			largeCoverImage.hashCode ^
			state.hashCode ^
			torrents.hashCode ^
			dateUploaded.hashCode ^
			dateUploadedUnix.hashCode;
}
