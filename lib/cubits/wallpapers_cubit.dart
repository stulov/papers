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
      final res = await locator.wallpaperRepository.getWallpapers(page);
      emit(WallpapersState.success(
        wallpapers: res.wallpapers,
        page: page,
        isLastPage: res.isLast,
      ));
    } catch (_) {
      emit(const WallpapersState.error());
    }
  }
}
