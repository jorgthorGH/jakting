import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/faq_card.dart';
import 'package:jaktapp/core/widgets/section_header.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_button.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            height: headerHeight,
            logoBottomOffset: logoBottomOffset,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader("Ofte stilte spørsmål"),

                  const SizedBox(height: 30),

                  FaqCard(
                    question:
                        "I dag er det søndag. Hvorfor har jeg bare søndag, mandag, og tirsdag på kalendern?",
                    answer:
                        "Lorem ipsum dolor sit amet consectetur. Odio velit sit sit pharetra hac. Est mattis non eget eget amet eu gravida scelerisque.\n\nLorem gravida augue ultrices aenean consequat. Turpis egestas quam vitae sollicitudin sit faucibus nec pharetra etiam.",
                    footerLabel: "Telefon til jaktutvalget",
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
                        "Hva skal jeg gjøre om flere deltagere ønsker å delta på jakten, når jeg allerede har skrevet ut jaktkort?",
                    answer:
                        "Lorem ipsum dolor sit amet consectetur. Odio velit sit sit pharetra hac. Est mattis non eget eget amet eu gravida scelerisque.",
                  ),

                  const SizedBox(height: 30),

                  FaqCard(
                    question:
                        "Hvorfor står det \"ikke tilgjengelig\" på alle terrenger? Det står heller ikke noen navn på det aktuelle terrenget denne dagen.",
                    answer:
                        "Har du reservert et terreng denne dagen? Når du reserverer et terreng blir allerede de andre terrengene gjort utilgjengelig for deg. Dette for å unngå dobbeltbooking. Da kan du oppleve at terrengene er \"ikke tilgjengelig\" uten at du finner noen som har reservert dem.",
                    btn: CustomButton(
                      text: "Samjaktskjema",
                      btnIcon: AppAssets.contactIcon,
                      onPressed: () {},
                      btnColor: AppColors.white,
                      textColor: AppColors.whiteBtnText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
