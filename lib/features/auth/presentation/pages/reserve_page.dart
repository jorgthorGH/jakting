import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/features/auth/presentation/pages/fill_out_hunt_card.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/models/terreng_data.dart';
import '../../../../core/utils/extensions.dart';

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
            ProfileHeader(
              height: context.height * 0.20,
              logoBottomOffset: context.height * 0.04,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        terreng.title,
                        style: GoogleFonts.aleo(
                          fontSize: 28,
                          color: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 20),

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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FillOutHuntCard())
                          );
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
                          Navigator.pop(context);
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
