import 'package:flutter/material.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/data/mock_user_data.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/item_card.dart';
import 'package:jaktapp/core/widgets/member_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/section_header.dart';
import 'package:jaktapp/core/widgets/user_info_card.dart';

import '../../../../core/models/terreng_data.dart';
import '../../../../core/widgets/guest_card.dart';

class FillOutHuntCard extends StatefulWidget {
  final TerrengData terreng;
  final DateTime selectedDate;

  const FillOutHuntCard({
    super.key,
    required this.terreng,
    required this.selectedDate,
  });

  @override
  State<FillOutHuntCard> createState() => _FillOutHuntCardState();
}

class _FillOutHuntCardState extends State<FillOutHuntCard> {
  final List<String> members = ["Ola Nordmann", "Karl Nordmann"];
  final List<String> guests = ["John Doe"];

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
                  SectionHeader("Fyll ut jaktkort"),

                  UserInfoCard(
                    userName: MockUserData.profile.name,
                    phone: MockUserData.profile.phone,
                    editLink: "Endre nummer", // Naviger til update_user
                  ),

                  const SizedBox(height: 30),

                  ItemCard(
                    title: widget.terreng.title,
                    imagePath: widget.terreng.img,
                    date: widget.selectedDate,
                  ),
                ],
              ),
            ),

            MemberCard(),

            GuestCard(),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    text: "Send på SMS",
                    btnIcon: AppAssets.arrowWhite,
                    onPressed: () {
                      print("Jaktkort sendt via SMS");
                    },
                    btnColor: AppColors.primaryBtnColor,
                    textColor: AppColors.white,
                    iconSize: 18,
                  ),

                  const Spacer(),

                  CustomButton(
                    text: "Avbryt",
                    btnIcon: AppAssets.cancelX,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    btnColor: AppColors.white,
                    textColor: AppColors.vippsColor,
                    iconSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
