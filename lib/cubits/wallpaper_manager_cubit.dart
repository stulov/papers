import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:papers/cubits/wallpaper_manager_state.dart';
import 'package:papers/di/locator.dart';
import 'package:papers/models/models.dart';

@singleton
class WallpaperManagerCubit extends Cubit<WallpaperManagerState> {
  WallpaperManagerCubit() : super(const WallpaperManagerState.pending());

  Future<void> saveAndMaybeSetWallpaper(Wallpaper wallpaper) async {
    emit(const WallpaperManagerState.processing());

    try {
      final tempPath =
          await locator.wallpaperRepository.saveWallpaper(wallpaper);
      await ImageGallerySaver.saveFile(tempPath);

      bool? didSetWallpaper;

      if (Platform.isAndroid) {
        didSetWallpaper = await WallpaperManager.setWallpaperFromFile(
          tempPath,
          WallpaperManager.HOME_SCREEN,
        );
      }

      if (didSetWallpaper ?? true) {
        emit(const WallpaperManagerState.success());
      } else {
        emit(const WallpaperManagerState.error());
      }
    } catch (_) {
      emit(const WallpaperManagerState.error());
    }
  }

  void invalidate() {
    emit(const WallpaperManagerState.pending());
  }
}
