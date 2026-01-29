import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/small_info_box.dart';

// Et kort som viser informasjon om valgt terreng/utstyr. Navnet på klassen bør endres for å bedre reflektere hva det faktisk er og brukes til.

class InfoCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final CustomButton? btn;
  final String? imagePath;
  final SmallInfoBox? infoBox;

  const InfoCard({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.btn,
    this.imagePath,
    this.infoBox,
  });

  @override
  Widget build(BuildContext context) {
    backgroundColor;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Image.asset(
                imagePath!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
          ],

          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    fontSize: 14,
                  ),
                ),
                if (btn != null) ...[const SizedBox(height: 20), btn!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
