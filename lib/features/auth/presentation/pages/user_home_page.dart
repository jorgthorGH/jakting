import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/app_colors.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.20;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProfileHeader(
              height: headerHeight,
              logoBottomOffset: context.height * 0.04,
            ),
          ),

          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: headerHeight),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Text(
                      "Forrige turer",
                      style: GoogleFonts.aleo(
                        fontSize: 28,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
