import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:papers/utils/icons.dart';

class DateTimeLabel extends StatelessWidget {
  final DateTime timestamp;
  final Color color;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;

  const DateTimeLabel({
    super.key,
    required this.timestamp,
    required this.color,
    this.iconSize = 12.0,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          PapersIcons.calendar,
          size: iconSize,
          color: color,
        ),
        const SizedBox(width: 3.0),
        Text(
          DateFormat('hh:mm (yyyy-mm-dd)').format(timestamp),
          style: GoogleFonts.montserrat(
            color: const Color(0xFF53587A),
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
