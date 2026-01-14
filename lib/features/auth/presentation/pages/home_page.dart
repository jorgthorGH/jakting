import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/button.dart';

import '../../../../features/auth/presentation/pages/login_page.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      // HEADER
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: context.height * 0.65,
            child:
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.jaktingHeaderFull,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: context.height * 0.10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.logoSVG,
                        width: context.width * 0.65,
                      ),
                    ),
                  ),
                ],
              ),
          ),

          // BUTTONS
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
                            MaterialPageRoute(builder: (context) => LoginPage())
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