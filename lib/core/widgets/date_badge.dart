import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../utils/extensions.dart';

class DateBadge extends StatelessWidget {
  final DateTime date;

  const DateBadge({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.tertiaryBtnColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 14),
          const SizedBox(width: 6),
          Text(
            date.toNorwegianDate, // Din extension
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}