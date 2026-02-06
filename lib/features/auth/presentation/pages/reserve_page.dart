import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/section_header.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/models/terreng_data.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/navigation/navigation.dart';

class ReservePage extends StatelessWidget {
  final TerrengData terreng;
  final DateTime selectedDate;

  const ReservePage({super.key, required this.terreng, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(terreng.title),

                      Image.asset(
                        terreng.img,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        text: "Fyll ut jaktkort",
                        btnIcon: AppAssets.huntCardIcon,
                        onPressed: () {
                          AppNav.navigateToHuntingCard(context, terreng, selectedDate);
                        },
                        btnColor: AppColors.primaryBtnColor,
                        textColor: AppColors.white,
                        width: context.width,
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        text: "Kanselere reservasjon",
                        btnIcon: AppAssets.cancelX,
                        onPressed: () {
                          AppNav.navigateBack(context);
                        },
                        btnColor: AppColors.white,
                        textColor: AppColors.vippsColor,
                        width: context.width,
                      ),

                      const SizedBox(height: 20),

                      InfoCard(
                        backgroundColor: AppColors.infoCardColorSecondary,
                        text: terreng.content,
                        date: "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}",
                        isAvailable: terreng.isAvailable,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
