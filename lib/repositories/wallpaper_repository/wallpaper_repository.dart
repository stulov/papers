import 'package:papers/repositories/wallpaper_repository/models/wallpapers_payload.dart';

abstract class WallpaperRepository {
  Future<WallpapersPayload> getWallpapers(int page);
}
