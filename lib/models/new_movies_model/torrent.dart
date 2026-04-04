import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'torrent.g.dart';

@JsonSerializable()
class Torrent {
	final String? url;
	final String? hash;
	final String? quality;
	final String? type;
	@JsonKey(name: 'is_repack') 
	final String? isRepack;
	@JsonKey(name: 'video_codec') 
	final String? videoCodec;
	@JsonKey(name: 'bit_depth') 
	final String? bitDepth;
	@JsonKey(name: 'audio_channels') 
	final String? audioChannels;
	final int? seeds;
	final int? peers;
	final String? size;
	@JsonKey(name: 'size_bytes') 
	final int? sizeBytes;
	@JsonKey(name: 'date_uploaded') 
	final String? dateUploaded;
	@JsonKey(name: 'date_uploaded_unix') 
	final int? dateUploadedUnix;

	const Torrent({
		this.url, 
		this.hash, 
		this.quality, 
		this.type, 
		this.isRepack, 
		this.videoCodec, 
		this.bitDepth, 
		this.audioChannels, 
		this.seeds, 
		this.peers, 
		this.size, 
		this.sizeBytes, 
		this.dateUploaded, 
		this.dateUploadedUnix, 
	});

	@override
	String toString() {
		return 'Torrent(url: $url, hash: $hash, quality: $quality, type: $type, isRepack: $isRepack, videoCodec: $videoCodec, bitDepth: $bitDepth, audioChannels: $audioChannels, seeds: $seeds, peers: $peers, size: $size, sizeBytes: $sizeBytes, dateUploaded: $dateUploaded, dateUploadedUnix: $dateUploadedUnix)';
	}

	factory Torrent.fromJson(Map<String, dynamic> json) {
		return _$TorrentFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TorrentToJson(this);

	Torrent copyWith({
		String? url,
		String? hash,
		String? quality,
		String? type,
		String? isRepack,
		String? videoCodec,
		String? bitDepth,
		String? audioChannels,
		int? seeds,
		int? peers,
		String? size,
		int? sizeBytes,
		String? dateUploaded,
		int? dateUploadedUnix,
	}) {
		return Torrent(
			url: url ?? this.url,
			hash: hash ?? this.hash,
			quality: quality ?? this.quality,
			type: type ?? this.type,
			isRepack: isRepack ?? this.isRepack,
			videoCodec: videoCodec ?? this.videoCodec,
			bitDepth: bitDepth ?? this.bitDepth,
			audioChannels: audioChannels ?? this.audioChannels,
			seeds: seeds ?? this.seeds,
			peers: peers ?? this.peers,
			size: size ?? this.size,
			sizeBytes: sizeBytes ?? this.sizeBytes,
			dateUploaded: dateUploaded ?? this.dateUploaded,
			dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Torrent) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			url.hashCode ^
			hash.hashCode ^
			quality.hashCode ^
			type.hashCode ^
			isRepack.hashCode ^
			videoCodec.hashCode ^
			bitDepth.hashCode ^
			audioChannels.hashCode ^
			seeds.hashCode ^
			peers.hashCode ^
			size.hashCode ^
			sizeBytes.hashCode ^
			dateUploaded.hashCode ^
			dateUploadedUnix.hashCode;
}
