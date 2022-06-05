import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:papers/components/components.dart';
import 'package:papers/cubits/cubits.dart';
import 'package:papers/cubits/wallpapers_state.dart';
import 'package:papers/di/locator.dart';
import 'package:papers/models/models.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static Page page() {
    return MaterialPage(
        name: PapersPages.explore,
        key: ValueKey(PapersPages.explore),
        child: const ExploreScreen());
  }

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _pagingController = PagingController<int, Wallpaper>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener(
      (pageKey) => locator.wallpapersCubit.getWallpapers(pageKey),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: PapersHeader(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            sliver: BlocListener<WallpapersCubit, WallpapersState>(
              bloc: locator.wallpapersCubit,
              listener: (context, state) {
                state.whenOrNull(success: (wallpapers, page, isLastPage) {
                  if (!isLastPage) {
                    _pagingController.appendPage(wallpapers, page + 1);
                  } else {
                    _pagingController.appendLastPage(wallpapers);
                  }
                }, error: () {
                  _pagingController.error = 'Failed to fetch wallpapers';
                });
              },
              child: PagedSliverGrid(
                  pagingController: _pagingController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.0,
                    mainAxisSpacing: 7.0,
                    childAspectRatio: 160 / 203,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<Wallpaper>(
                      itemBuilder: (context, item, index) {
                    return WallpaperGridItem(
                      wallpaper: item,
                      onTap: () => locator.appRouterCubit.viewWallpaper(item),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}
