import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';

class SmallInfoBox extends StatelessWidget {
  final String text;

  const SmallInfoBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.smallInfoBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: AppColors.white,
        ),
      ),
    );
  }
}
