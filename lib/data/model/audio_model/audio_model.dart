// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AudioModel {
  String nameSong;
  String nameSinger;
  String url;
  String thumbnail;

  AudioModel({
    required this.nameSong,
    required this.nameSinger,
    required this.url,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameSong': nameSong,
      'nameSinger': nameSinger,
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      nameSong: map['nameSong'] as String,
      nameSinger: map['nameSinger'] as String,
      url: map['url'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AudioModel(nameSong: $nameSong, nameSinger: $nameSinger, url: $url, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant AudioModel other) {
    if (identical(this, other)) return true;

    return other.nameSong == nameSong &&
        other.nameSinger == nameSinger &&
        other.url == url &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return nameSong.hashCode ^
        nameSinger.hashCode ^
        url.hashCode ^
        thumbnail.hashCode;
  }
}
