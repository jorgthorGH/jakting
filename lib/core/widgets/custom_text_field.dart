import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final bool obscureText;
  final String? smallText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? color;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.obscureText = false,
    this.smallText,
    this.controller,
    this.keyboardType,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.hintText),
      decoration: InputDecoration(
        filled: true,
        fillColor: color ?? Colors.white,
        hintText: null, // Remove default hintText
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              hintText,
              style: GoogleFonts.poppins(color: AppColors.hintText),
            ),
            if (smallText != null)
              Text(
                ' $smallText',
                style: GoogleFonts.poppins(
                  color: AppColors.hintText,
                  fontSize: 10, // Smaller font size
                ),
              ),
          ],
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(iconPath, width: 20, height: 20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
