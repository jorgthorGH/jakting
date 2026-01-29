import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

// Klassen oppretter en liste med lenker for mer-knappen i navbar, med blant annet lenke til FAQ/ofte stilte spørsmål.

class MoreLinkItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const MoreLinkItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: GoogleFonts.poppins(
              color: isLogout ? Colors.redAccent : AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        const Divider(color: AppColors.greyWhite, thickness: 0.5),
      ],
    );
  }
}