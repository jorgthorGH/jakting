import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/button.dart';

class RegisterSuccess extends StatelessWidget {
  final String userName;
  const RegisterSuccess({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Seksjon
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppAssets.jaktingHeader,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(left: 30, child: Image.asset(AppAssets.logoVector)),
            ],
          ),

          const SizedBox(height: 55),

          Center(
            child: Column(
              children: [
                Text(
                  "Registrering suksess",
                  style: GoogleFonts.aleo(
                    color: AppColors.suksess,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Velkommen",
                  style: GoogleFonts.aleo(
                    color: AppColors.white,
                    fontSize: 28,
                    letterSpacing: 0,
                  ),
                ),

                const SizedBox(height: 15),
                Text(
                  userName,
                  style: GoogleFonts.aleo(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 30),

                Image.asset(AppAssets.iconSuccess, height: 130, width: 130),

                const SizedBox(height: 60),
                Text(
                  "Du kan fortsette med", 
                   style: GoogleFonts.aleo(
                          color: AppColors.white,
                          fontSize: 16,
                          letterSpacing: 0),
                 ),

                const SizedBox(height: 30),

                CustomButton(
                  text: "Våre terreng", 
                  btnIcon: AppAssets.iconTrail, 
                  onPressed: () {}, 
                  btnColor: AppColors.primaryBtnColor, 
                  textColor: AppColors.white,
                  
                 
                  ),

                const SizedBox(height: 25),
                 Text(
                  "eller", 
                   style: GoogleFonts.aleo(
                          color: AppColors.white,
                          fontSize: 16,
                          letterSpacing: 0),
                 ),

                 const SizedBox(height: 25),

                 CustomButton(
                  text: "Min side", 
                  btnIcon: AppAssets.iconPerson,
                  onPressed: () {},
                  btnColor: AppColors.secondaryBtnColor, 
                  textColor: AppColors.white),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
