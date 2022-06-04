import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:papers/models/models.dart';

part 'wallpapers_payload.freezed.dart';

@freezed
class WallpapersPayload with _$WallpapersPayload {
  const factory WallpapersPayload({
    required List<Wallpaper> wallpapers,
    required bool isLast,
  }) = _WallpapersPayload;
}
