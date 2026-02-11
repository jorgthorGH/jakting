import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';

import '../utils/extensions.dart';

class UserInfoCard extends StatelessWidget {
  final String userName;
  final String phone;
  final String editLink;

  const UserInfoCard({
    super.key,
    required this.userName,
    required this.phone,
    required this.editLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.cardBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: GoogleFonts.aleo(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              SizedBox(
                height: 35,
                child: CustomButton(
                  text: phone,
                  btnIcon: AppAssets.phoneIconWhite,
                  onPressed: () {
                    print("Ringer...");
                  },
                  btnColor: AppColors.tertiaryBtnColor,
                  textColor: AppColors.white,
                  iconSize: 18,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                editLink, // Skal byttes ut med lenke til å endre tlfnr.
                style: TextStyle(
                  color: AppColors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
