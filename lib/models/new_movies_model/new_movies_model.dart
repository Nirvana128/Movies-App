import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'meta.dart';

part 'new_movies_model.g.dart';

@JsonSerializable()
class NewMoviesModel {
	final String? status;
	@JsonKey(name: 'status_message') 
	final String? statusMessage;
	final Data? data;
	@JsonKey(name: '@meta') 
	final Meta? meta;

	const NewMoviesModel({
		this.status, 
		this.statusMessage, 
		this.data, 
		this.meta, 
	});

	@override
	String toString() {
		return 'NewMoviesModel(status: $status, statusMessage: $statusMessage, data: $data, meta: $meta)';
	}

	factory NewMoviesModel.fromJson(Map<String, dynamic> json) {
		return _$NewMoviesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NewMoviesModelToJson(this);

	NewMoviesModel copyWith({
		String? status,
		String? statusMessage,
		Data? data,
		Meta? meta,
	}) {
		return NewMoviesModel(
			status: status ?? this.status,
			statusMessage: statusMessage ?? this.statusMessage,
			data: data ?? this.data,
			meta: meta ?? this.meta,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! NewMoviesModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			status.hashCode ^
			statusMessage.hashCode ^
			data.hashCode ^
			meta.hashCode;
}
