import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papers/cubits/app_router_state.dart';

import 'package:papers/di/locator.dart';
import 'package:papers/models/models.dart';

import 'package:papers/screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: locator.appRouterCubit,
      builder: (context, state) {
        return Navigator(
          key: navigatorKey,
          onPopPage: _handlePopPage,
          pages: [
            ExploreScreen.page(),
            if (state is WallpaperPageState)
              WallpaperScreen.page(state.wallpaper),
          ],
        );
      },
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == PapersPages.wallpaper) {
      locator.appRouterCubit.exploreWallpapers();
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
