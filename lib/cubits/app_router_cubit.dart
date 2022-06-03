import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:papers/cubits/app_router_state.dart';
import 'package:papers/models/models.dart';

@singleton
class AppRouterCubit extends Cubit<AppRouterState> {
  AppRouterCubit() : super(const AppRouterState.explore());

  void viewWallpaper(Wallpaper wallpaper) {
    emit(AppRouterState.wallpaper(wallpaper));
  }

  void exploreWallpapers() {
    emit(const AppRouterState.explore());
  }
}
