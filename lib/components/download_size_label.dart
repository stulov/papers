import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/utils/icons.dart';

class DownloadSizeLabel extends StatelessWidget {
  final int downloadSizeInBytes;
  final Color color;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;

  const DownloadSizeLabel({
    super.key,
    required this.downloadSizeInBytes,
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
          PapersIcons.download,
          size: iconSize,
          color: color,
        ),
        const SizedBox(width: 3.0),
        Text(
          '${(downloadSizeInBytes / 1024 / 1024).toStringAsFixed(1)} MB',
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
