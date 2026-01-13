import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: AppColors.hintText,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}