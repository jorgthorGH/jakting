import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/extensions.dart';

class ProfileHeader extends StatelessWidget {
  final double height;
  final double logoBottomOffset;
  final double logoWidthPercent;

  const ProfileHeader({
    super.key,
    required this.height,
    this.logoBottomOffset = 30,
    this.logoWidthPercent = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    // Placeholders
    const String userName = "Kari Nordmann";

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            AppAssets.jaktingHeader,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),

          Positioned(
            bottom: logoBottomOffset,
            left: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.logoSmall,
                  width: context.width * logoWidthPercent,
                  fit: BoxFit.contain,
                ),

                const SizedBox(width: 15),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    GestureDetector(
                      onTap: () {
                        print("Naviger til rediger profil...");
                      },
                      child: Row(
                        children: [
                          Text(
                            "Rediger profil",
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 4),

                          Icon(
                            Icons.edit_outlined,
                            color: AppColors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}