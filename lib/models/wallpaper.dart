import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallpaper.freezed.dart';
part 'wallpaper.g.dart';

@freezed
class Wallpaper with _$Wallpaper {
  const factory Wallpaper({
    required String id,
    required String category,
    required String resolution,
    required int favorites,
    @JsonKey(name: 'dimension_x') required int dimensionX,
    @JsonKey(name: 'dimension_y') required int dimensionY,
    @JsonKey(name: 'file_size') required int fileSize,
    @JsonKey(name: 'created_at', fromJson: DateTime.parse)
        required DateTime createdAt,
    @JsonKey(fromJson: Uri.parse) required Uri path,
    @JsonKey(readValue: _readThumb, fromJson: Uri.parse) required Uri thumb,
  }) = _Wallpaper;

  factory Wallpaper.fromJson(Map<String, dynamic> json) =>
      _$WallpaperFromJson(json);
}

Object? _readThumb(json, key) => json['thumbs']['small'];
