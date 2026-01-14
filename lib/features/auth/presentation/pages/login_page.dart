import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/utils/extensions.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/button.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.20;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.jaktingHeader,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 30,
                  child: Image.asset(AppAssets.logoVector),
                ),
              ],
            ),
          ),


          // SKJEMA
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: headerHeight),

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logg inn",
                        style: GoogleFonts.aleo(
                          fontSize: 28,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // E-post
                      const CustomTextField(
                        hintText: "E-post",
                        iconPath: AppAssets.iconEmail,
                      ),

                      const SizedBox(height: 30),

                      // Passord
                      const CustomTextField(
                        hintText: "Passord",
                        iconPath: AppAssets.iconPassword,
                        obscureText: true,
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                        text: "Logg inn",
                        btnIcon: AppAssets.loginIcon,
                        btnColor: AppColors.primaryBtnColor,
                        textColor: AppColors.white,
                        onPressed: () {},
                      ),

                      const SizedBox(height: 50),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Glemt passord?",
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 4),

                          GestureDetector(
                            onTap: () {
                              print ("Naviger til tilbakestilling...");
                            },
                            child: Text(
                              "Tilbakestill ditt passord her!",
                              style: GoogleFonts.poppins(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),

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