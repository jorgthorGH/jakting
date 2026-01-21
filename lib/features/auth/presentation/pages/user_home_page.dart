import 'package:flutter/material.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/custom_navbar.dart';
import 'package:jaktapp/core/widgets/item_card.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/info_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/features/auth/presentation/pages/register_new_person.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/app_colors.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.20;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: headerHeight),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forrige turer",
                          style: GoogleFonts.aleo(
                            fontSize: 28,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        InfoCard(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                        ),
                        const SizedBox(height: 30),
                        ItemCard(
                          header: "Båt & henger",
                          img: Image.asset(AppAssets.boat),
                          reportUrl: "Lever fangstrapport",
                          date: DateTime.now(),
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Registrer ny person",
                          btnIcon: AppAssets.personWhite,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterNewPerson(),
                              ),
                            );
                          },
                          btnColor: AppColors.primaryBtnColor,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. ProfileHeader ligger øverst i Stack så den kan trykkes på
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProfileHeader(
              height: headerHeight,
              logoBottomOffset: context.height * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
