import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/utils/extensions.dart';

// Kortene som vises i terreng- og utstyrsoversikt med et bilde, en tittel og om terreng/utstyret er ledig for leie eller ikke.

class CardScrollable extends StatelessWidget {
  final String title;
  final String img;
  final bool isAvailable;
  final VoidCallback onTap;

  const CardScrollable({
    super.key,
    required this.title,
    required this.img,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final double opacity = isAvailable ? 0.5 : 0.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: opacity),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isAvailable ? "Ledig" : "Ikke tilgjengelig",
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),

                    Container(
                      width: context.width * 0.05,
                      height: context.height * 0.02,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isAvailable ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
