// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../cubits/app_router_cubit.dart' as _i3;
import '../cubits/wallpapers_cubit.dart' as _i6;
import '../repositories/wallpaper_repository/wallhaven_repository.dart' as _i5;
import '../repositories/wallpaper_repository/wallpaper_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppRouterCubit>(_i3.AppRouterCubit());
  gh.singleton<_i4.WallpaperRepository>(_i5.WallhavenRepository());
  gh.singleton<_i6.WallpapersCubit>(_i6.WallpapersCubit());
  return get;
}
