import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/small_info_box.dart';
import 'package:jaktapp/features/auth/presentation/pages/reserve_page.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/models/terreng_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

class ItemOverview extends StatelessWidget {
  final TerrengData terreng;
  final DateTime selectedDate;


  const ItemOverview({super.key, required this.terreng, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              height: context.height * 0.20,
              logoBottomOffset: context.height * 0.04,
            ),

            Column(
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Column(
                        children: [
                          InfoCard(
                            backgroundColor: AppColors.infoCardColorSecondary,
                            imagePath: terreng.img,
                            text: terreng.content,
                            infoBox: terreng.info != null
                                ? SmallInfoBox(text: terreng.info!)
                                : null,
                            date: "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}",
                            isAvailable: terreng.isAvailable,

                            // Mangler valgt dato fra bruker og ledighet/tilgjengelighet

                            btn: CustomButton(
                                text: "Reserver",
                                btnIcon: AppAssets.reserveIcon,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReservePage(terreng: terreng, selectedDate: selectedDate),
                                    ),
                                  );
                                },
                                btnColor: AppColors.primaryBtnColor,
                                textColor: AppColors.white,
                                width: context.width,
                            ),
                          ),
                        ],
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
