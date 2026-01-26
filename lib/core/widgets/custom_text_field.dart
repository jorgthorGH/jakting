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
  final bool showEditIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.obscureText = false,
    this.smallText,
    this.controller,
    this.keyboardType,
    this.color,
   this.showEditIcon = false, 
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
        hintText: smallText != null ? '$hintText $smallText' : hintText,
        hintStyle: GoogleFonts.poppins(color: AppColors.hintText),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(iconPath, width: 20, height: 20),
        ),
        suffixIcon: showEditIcon
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/editinput.png', // Or AppAssets.editInput if you add it there
                  width: 32,
                  height: 32,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
