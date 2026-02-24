import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/models/user_model.dart';
import 'package:jaktapp/core/theme/app_colors.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../features/auth/presentation/pages/update_user.dart';
import '../data/mock_user_data.dart';

// Headeren som vises for en innlogget bruker.
class ProfileHeader extends StatelessWidget {
  final double? height;
  final double? logoBottomOffset;
  final double avatar;
  final UserModel? user;

  const ProfileHeader({
    super.key,
    this.height,
    this.logoBottomOffset,
    this.avatar = 0.15,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = user ?? MockUserData.profile;
    final double effectiveHeight = height ?? context.height * 0.20;
    final double effectiveOffset = logoBottomOffset ?? context.height * 0.04;

    return SizedBox(
      height: effectiveHeight,
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
            bottom: effectiveOffset,
            left: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.logoSmall,
                  width: context.width * avatar,
                  fit: BoxFit.contain,
                ),

                const SizedBox(width: 15),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser.name,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateUser(),
                          ),
                        );
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
