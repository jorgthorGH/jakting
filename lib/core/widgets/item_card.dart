import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Dette kortet skal brukes på en brukers egen profil/Min Side.

class ItemCard extends StatelessWidget {
  final Image? img;
  final String header;
  final String reportUrl;
  final DateTime date;

  const ItemCard({
    super.key,
    this.img,
    required this.header,
    required this.reportUrl,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.itemCardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (img != null) ...[
              img!,
              const SizedBox(height: 10),
            ],
            Text(
              header,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              reportUrl,
              style: const TextStyle(
                color: AppColors.primaryBtnColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
