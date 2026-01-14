import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'button.dart';

class BottomCard extends StatelessWidget {
  final String descriptionText;
  final String buttonText;
  final String btnIcon;
  final VoidCallback onPressed;
  final Color btnColor;

  const BottomCard({
    super.key,
    required this.descriptionText,
    required this.buttonText,
    required this.btnIcon,
    required this.onPressed,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            descriptionText,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          Center(
            child: CustomButton(
              text: buttonText,
              btnIcon: btnIcon,
              btnColor: btnColor,
              textColor: AppColors.white,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}