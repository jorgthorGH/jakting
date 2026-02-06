import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/utils/extensions.dart';
import 'package:jaktapp/core/widgets/status_badge.dart';

import 'date_badge.dart';

// Dette kortet skal brukes på en brukers egen profil/Min Side.

class ItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final DateTime date;

  const ItemCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 92,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const StatusRow(),

                const SizedBox(height: 8),

                DateBadge(date: date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
