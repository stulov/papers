import 'package:papers/cubits/cubits.dart';
import 'package:papers/di/injection.dart';
import 'package:papers/repositories/wallpaper_repository/wallpaper_repository.dart';

class _Locator {
  late final appRouterCubit = getIt<AppRouterCubit>();

  late final wallpaperRepository = getIt<WallpaperRepository>();

  late final wallpaperCubit = getIt<WallpapersCubit>();
}

final locator = _Locator();
