import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/utils/palette.dart';

class PapersHeader extends StatelessWidget {
  const PapersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 14.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Wallpapers',
              style: GoogleFonts.lato(
                color: Palette.darkGrey,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                height: 40.0 / 26.0,
              ),
            ),
            const SizedBox(height: 3.0),
            Text(
              'Find the best wallpapers for you',
              style: GoogleFonts.raleway(
                color: Palette.darkGrey,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.55,
                height: 20.0 / 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
