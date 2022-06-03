import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:papers/models/models.dart';

part 'app_router_state.freezed.dart';

@freezed
class AppRouterState with _$AppRouterState {
  const factory AppRouterState.explore() = ExplorePageState;
  const factory AppRouterState.wallpaper(Wallpaper wallpaper) =
      WallpaperPageState;
}
