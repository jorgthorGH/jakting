import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/widgets/faq_card.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:jaktapp/core/widgets/section_header.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/list_link_items.dart';
import '../../../../core/widgets/profile_header.dart';

class MoreFaq extends StatelessWidget {
  const MoreFaq({super.key});

  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.20;
    final logoBottomOffset = context.height * 0.04;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ProfileHeader(
            height: headerHeight,
            logoBottomOffset: logoBottomOffset,
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader("Ofte stilte spørsmål"),

                const SizedBox(height: 30),

                FaqCard(
                  question:
                      "I dag er det søndag. Hvorfor har jeg bare søndag, mandag og tirsdag på kalenderen?",
                  answer:
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laud",
                  btn: CustomButton(
                    text: "92059501",
                    btnIcon: AppAssets.phoneIcon,
                    onPressed: () {},
                    btnColor: AppColors.white,
                    textColor: AppColors.whiteBtnText,
                  ),
                ),

                const SizedBox(height: 30),

                FaqCard(
                  question:
                      "Hva skal jeg gjøre om flere deltagere ønsker å delta på jaken, når jeg allerede har skrevet ut jaktkort?",
                  answer:
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laud",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
