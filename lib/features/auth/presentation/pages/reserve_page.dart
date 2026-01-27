import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

import '../../../../core/models/terreng_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

class ReservePage extends StatelessWidget {
  final TerrengData terreng;

  const ReservePage({super.key, required this.terreng});

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ProfileHeader(
            height: context.height * 0.20,
            logoBottomOffset: context.height * 0.04,
          ),
          Text(
            terreng.title,
            style: GoogleFonts.aleo(
              fontSize: 28,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
