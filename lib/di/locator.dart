import 'package:papers/cubits/cubits.dart';
import 'package:papers/di/injection.dart';
import 'package:papers/repositories/wallpaper_repository/wallpaper_repository.dart';

class _Locator {
  late final appRouterCubit = getIt<AppRouterCubit>();

  late final wallpaperRepository = getIt<WallpaperRepository>();

  late final wallpapersCubit = getIt<WallpapersCubit>();

  late final wallpaperManagerCubit = getIt<WallpaperManagerCubit>();
}

final locator = _Locator();
