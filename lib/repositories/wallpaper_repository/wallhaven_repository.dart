import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:papers/api/wallhaven/wallhaven_api.dart';
import 'package:papers/models/models.dart';
import 'package:papers/repositories/wallpaper_repository/models/wallpapers_payload.dart';
import 'package:papers/repositories/wallpaper_repository/wallpaper_repository.dart';
import 'package:path_provider/path_provider.dart';

@Singleton(as: WallpaperRepository)
class WallhavenRepository implements WallpaperRepository {
  final _dio = Dio();
  late final _api = WallhavenApi(_dio);

  @override
  Future<WallpapersPayload> getWallpapers(int page) async {
    try {
      final response = await _api.getWallpapers(page);

      return WallpapersPayload(
        wallpapers: response.data,
        isLast: response.meta.currentPage == response.meta.lastPage,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> saveWallpaper(Wallpaper wallpaper) async {
    final fileName = wallpaper.path.pathSegments.last;

    try {
      final appDir = await getTemporaryDirectory();
      final tempPath = '${appDir.path}/$fileName';

      await _dio.downloadUri(wallpaper.path, tempPath);

      return tempPath;
    } catch (_) {
      rethrow;
    }
  }
}
