import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:papers/cubits/wallpapers_state.dart';
import 'package:papers/di/locator.dart';

@singleton
class WallpapersCubit extends Cubit<WallpapersState> {
  WallpapersCubit() : super(const WallpapersState.loading());

  Future<void> getWallpapers(int page) async {
    emit(const WallpapersState.loading());

    try {
      emit(WallpapersState.success(
        wallpapers: await locator.wallpaperRepository.getWallpapers(page),
        page: page,
      ));
    } catch (_) {
      emit(const WallpapersState.error());
    }
  }
}
