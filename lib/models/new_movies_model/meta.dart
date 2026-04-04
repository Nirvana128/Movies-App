import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
	@JsonKey(name: 'api_version') 
	final int? apiVersion;
	@JsonKey(name: 'execution_time') 
	final String? executionTime;

	const Meta({this.apiVersion, this.executionTime});

	@override
	String toString() {
		return 'Meta(apiVersion: $apiVersion, executionTime: $executionTime)';
	}

	factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

	Map<String, dynamic> toJson() => _$MetaToJson(this);

	Meta copyWith({
		int? apiVersion,
		String? executionTime,
	}) {
		return Meta(
			apiVersion: apiVersion ?? this.apiVersion,
			executionTime: executionTime ?? this.executionTime,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Meta) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => apiVersion.hashCode ^ executionTime.hashCode;
}
