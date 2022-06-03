import 'package:papers/models/models.dart';

abstract class WallpaperRepository {
  Future<List<Wallpaper>> getWallpapers(int page);
}
