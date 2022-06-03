import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:papers/api/wallhaven/wallhaven_api.dart';
import 'package:papers/models/models.dart';
import 'package:papers/repositories/wallpaper_repository/wallpaper_repository.dart';

@Singleton(as: WallpaperRepository)
class WallhavenRepository implements WallpaperRepository {
  final _api = WallhavenApi(Dio());

  @override
  Future<List<Wallpaper>> getWallpapers(int page) async {
    try {
      final response = await _api.getWallpapers(page);

      return response.data;
    } catch (_) {
      rethrow;
    }
  }
}
