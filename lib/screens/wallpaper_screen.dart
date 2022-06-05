import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/components/components.dart';
import 'package:papers/cubits/cubits.dart';
import 'package:papers/cubits/wallpaper_manager_state.dart';
import 'package:papers/di/locator.dart';
import 'package:papers/models/models.dart';
import 'package:papers/utils/palette.dart';

class WallpaperScreen extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperScreen({
    super.key,
    required this.wallpaper,
  });

  static Page page(Wallpaper wallpaper) {
    return MaterialPage(
      name: PapersPages.wallpaper,
      key: ValueKey(PapersPages.wallpaper),
      child: WallpaperScreen(wallpaper: wallpaper),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: wallpaper.path.toString(),
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                ),
                padding: const EdgeInsets.all(2.0),
                margin: const EdgeInsets.all(12.0),
                child: IconButton(
                  onPressed: () {
                    locator.appRouterCubit.exploreWallpapers();
                    locator.wallpaperManagerCubit.invalidate();
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    color: Palette.darkGrey,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xCCF5F4F8),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ResolutionLabel(
                              dimensionX: wallpaper.dimensionX,
                              dimensionY: wallpaper.dimensionY,
                              iconSize: 12.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Palette.fadedViolet,
                            ),
                            const SizedBox(width: 10.0),
                            DownloadSizeLabel(
                              downloadSizeInBytes: wallpaper.fileSize,
                              iconSize: 12.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Palette.fadedViolet,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        DateTimeLabel(
                          timestamp: wallpaper.createdAt,
                          color: Palette.fadedViolet,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: BlocConsumer<WallpaperManagerCubit,
                            WallpaperManagerState>(
                        bloc: locator.wallpaperManagerCubit,
                        listener: (context, state) {
                          const snackBar = SnackBar(
                            content: Text('Failed to set wallpaper.'),
                          );
                          state.whenOrNull(
                              error: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar));
                        },
                        builder: (context, state) {
                          callbackDecorator() {
                            return () => locator.wallpaperManagerCubit
                                .saveAndMaybeSetWallpaper(wallpaper);
                          }

                          return TextButton(
                            onPressed: state.whenOrNull(
                              pending: callbackDecorator,
                              error: callbackDecorator,
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 22.0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF8BC83F),
                              ),
                            ),
                            child: state.maybeWhen(
                              processing: () => const SizedBox(
                                height: 16.0,
                                width: 16.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              orElse: () => Text(
                                Platform.isAndroid
                                    ? 'Set as Wallpaper'
                                    : 'Download',
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
