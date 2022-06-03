import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:papers/models/models.dart';

part 'wallpapers_state.freezed.dart';

@freezed
class WallpapersState with _$WallpapersState {
  const factory WallpapersState.success({
    required List<Wallpaper> wallpapers,
    required int page,
  }) = WallpapersSuccessState;

  const factory WallpapersState.loading() = WallpapersLoadingState;

  const factory WallpapersState.error() = WallpapersErrorState;
}
