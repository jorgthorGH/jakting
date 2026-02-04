import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jaktapp/core/data/mock_user_data.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/utils/extensions.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/user_info_card.dart';

class FillOutHuntCard extends StatelessWidget{
  const FillOutHuntCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            height: context.height * 0.20,
            logoBottomOffset: context.height * 0.04,
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: UserInfoCard(
                userName: MockUserData.profile.name,
                phone: MockUserData.profile.phone,
                editLink: "Endre nummer",
            ),
          ),
        ],
      ),
    );
  }
}