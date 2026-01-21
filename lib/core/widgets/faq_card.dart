import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/button.dart';
import '../theme/app_colors.dart';

class FaqCard extends StatelessWidget {

  final String question;
  final String answer;
  final CustomButton? btn;

  const FaqCard({super.key, required this.question, required this.answer, this.btn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.infoCardColor,
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
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
            ),
            answer,
          ),
          const SizedBox(height: 10),
          if (btn != null) ...[
            btn!,
          ],
        ],
      ),
    );
  }
}