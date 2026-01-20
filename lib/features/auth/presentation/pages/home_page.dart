import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/header_full.dart';

import '../../../../features/auth/presentation/pages/login_page.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.65;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderFull(
              height: headerHeight,
              logoBottomOffset: context.height * 0.45,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: context.height * 0.55),

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      CustomButton(
                        text: "Logg inn med epost",
                        btnIcon: AppAssets.loginIcon,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        btnColor: AppColors.primaryBtnColor,
                        textColor: AppColors.white,
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                        text: "Logg inn med Vipps",
                        btnIcon: AppAssets.vippsLogo,
                        onPressed: () {},
                        btnColor: AppColors.white,
                        textColor: AppColors.vippsColor,
                      ),

                      const SizedBox(height: 30),

                      BottomCard(
                        descriptionText: "Har du ikke en konto?",
                        buttonText: "Registrer deg",
                        btnIcon: AppAssets.regiIcon,
                        btnColor: AppColors.secondaryBtnColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}