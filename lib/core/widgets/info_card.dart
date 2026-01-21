import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/widgets/button.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/extensions.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final CustomButton? btn;

  const InfoCard({super.key, required this.text, this.btn});

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
            text,
            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14),
          ),
          if (btn != null) ...[
            const SizedBox(height: 10),
            btn!,
          ],
        ],
      ),
    );
  }
}
