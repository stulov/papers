import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/utils/icons.dart';

class ResolutionLabel extends StatelessWidget {
  final int dimensionX;
  final int dimensionY;
  final Color color;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;

  const ResolutionLabel({
    super.key,
    required this.dimensionX,
    required this.dimensionY,
    required this.color,
    this.iconSize = 9.0,
    this.fontSize = 11.0,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          PapersIcons.resolution,
          size: iconSize,
          color: color,
        ),
        const SizedBox(width: 2.0),
        RichText(
          text: TextSpan(
            text: dimensionX.toString(),
            style: GoogleFonts.montserrat(
              color: const Color(0xFF53587A),
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            children: [
              TextSpan(
                text: 'x',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: dimensionY.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
