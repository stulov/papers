import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/components/item_tag.dart';
import 'package:papers/models/models.dart';
import 'package:papers/utils/icons.dart';
import 'package:papers/utils/palette.dart';

class WallpaperGridItem extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperGridItem({
    super.key,
    required this.wallpaper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                const Icon(
                  PapersIcons.resolution,
                  size: 9.0,
                  color: Color(0xFF53587A),
                ),
                const SizedBox(width: 2.0),
                RichText(
                  text: TextSpan(
                    text: wallpaper.dimensionX.toString(),
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF53587A),
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'x',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: wallpaper.dimensionY.toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 18.0),
                const Icon(
                  PapersIcons.download,
                  size: 9.0,
                  color: Color(0xFF53587A),
                ),
                const SizedBox(width: 3.0),
                Text(
                  '${(wallpaper.fileSize / 1024 / 1024).toStringAsFixed(1)} MB',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF53587A),
                    fontSize: 10.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
