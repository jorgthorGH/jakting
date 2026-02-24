import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_button.dart';
import '../theme/app_colors.dart';

// Ofte stilte spørsmål

class FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  final CustomButton? btn;
  final String? footerLabel;

  const FaqCard({
    super.key,
    required this.question,
    required this.answer,
    this.btn,
    this.footerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            question,
          ),
          const SizedBox(height: 10),
          Text(
            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14),
            answer,
          ),
          if (footerLabel != null) ...[
            const SizedBox(height: 18),
            Text(
              footerLabel!,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          if (btn != null) ...[const SizedBox(height: 10), btn!],
        ],
      ),
    );
  }
}
