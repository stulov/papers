import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallpaper_manager_state.freezed.dart';

@freezed
class WallpaperManagerState with _$WallpaperManagerState {
  const factory WallpaperManagerState.processing() =
      WallpaperManagerProcessingState;
  const factory WallpaperManagerState.pending() = WallpaperManagerPendingState;
  const factory WallpaperManagerState.success() = WallpaperManagerSuccessState;
  const factory WallpaperManagerState.error() = WallpaperManagerErrorState;
}
