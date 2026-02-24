import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/section_header.dart';
import 'package:jaktapp/core/widgets/small_info_box.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/models/terreng_data.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

class ItemOverview extends StatelessWidget {
  final TerrengData terreng;
  final DateTime selectedDate;

  const ItemOverview({
    super.key,
    required this.terreng,
    required this.selectedDate
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(terreng.title),

                  _buildInfoCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return InfoCard(
      backgroundColor: AppColors.infoCardColorSecondary,
      imagePath: terreng.img,
      text: terreng.content,
      infoBox: terreng.info != null ? SmallInfoBox(text: terreng.info!) : null,
      date: selectedDate.toNorwegianDate,
      isAvailable: terreng.isAvailable,
      btn: CustomButton(
        text: "Reserver",
        btnIcon: AppAssets.reserveIcon,
        onPressed: () => AppNav.navigateToReservation(context, terreng, selectedDate),
        btnColor: AppColors.primaryBtnColor,
        textColor: AppColors.white,
        width: context.width,
      ),
    );
  }
}