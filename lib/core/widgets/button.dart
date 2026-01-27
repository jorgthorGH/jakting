import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/extensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String btnIcon;
  final VoidCallback onPressed;
  final Color btnColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double? iconSize;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.btnIcon,
    required this.onPressed,
    required this.btnColor,
    required this.textColor,
    this.width,
    this.height,
    this.isLoading = false,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSizeResponsive = iconSize ?? context.width * 0.06;

    return SizedBox(
      width: width,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: iconSizeResponsive,
                height: iconSizeResponsive,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    btnIcon,
                    width: iconSizeResponsive,
                    height: iconSizeResponsive,
                  ),

                  const SizedBox(width: 8),

                  Flexible(
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(fontSize: 16, color: textColor),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
