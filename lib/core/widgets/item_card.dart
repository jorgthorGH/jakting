import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Dette kortet skal brukes på en brukers egen profil/Min Side.

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String headText;
  final String? statusTag;
  final String? dateTag;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.headText,
    this.statusTag,
    this.dateTag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          height: 78,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Column(
          children: [
            Text(
              headText,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
