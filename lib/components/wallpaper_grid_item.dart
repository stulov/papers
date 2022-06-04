import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papers/components/components.dart';
import 'package:papers/models/models.dart';
import 'package:papers/utils/palette.dart';

class WallpaperGridItem extends StatelessWidget {
  final Wallpaper wallpaper;
  final VoidCallback? onTap;

  const WallpaperGridItem({
    super.key,
    required this.wallpaper,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final gridItem = Container(
      decoration: BoxDecoration(
        color: Palette.softGrey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: const Color(0xFFD9D9D9),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: wallpaper.thumb.toString(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Row(
                    children: [
                      ItemTag(
                        icon: Icons.favorite,
                        text: '${wallpaper.favorites}',
                      ),
                      const SizedBox(width: 3.0),
                      ItemTag(
                        text: wallpaper.category,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
            child: Row(
              children: [
                ResolutionLabel(
                  dimensionX: wallpaper.dimensionX,
                  dimensionY: wallpaper.dimensionY,
                  color: Palette.fadedViolet,
                ),
                const SizedBox(width: 18.0),
                DownloadSizeLabel(
                  downloadSizeInBytes: wallpaper.fileSize,
                  color: Palette.fadedViolet,
                  fontSize: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return onTap == null
        ? gridItem
        : GestureDetector(
            onTap: onTap,
            child: gridItem,
          );
  }
}
