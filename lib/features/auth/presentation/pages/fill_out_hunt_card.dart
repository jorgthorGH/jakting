import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/data/mock_user_data.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/utils/extensions.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/section_header.dart';
import 'package:jaktapp/core/widgets/user_info_card.dart';

import '../../../../core/models/terreng_data.dart';

class FillOutHuntCard extends StatelessWidget{

  const FillOutHuntCard({super.key});

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
                    editLink: "Endre nummer",
                  ),

                  const SizedBox(height: 8),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}