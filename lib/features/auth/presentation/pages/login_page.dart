import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Positioned(
                left: 30,
                child: Image.asset(AppAssets.logoVector),
              ),
            ],
          ),

          // Skjema Seksjon
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

                // E-post felt (Gjenbruk)
                const CustomTextField(
                  hintText: "E-post",
                  iconPath: AppAssets.iconEmail,
                ),

                const SizedBox(height: 30),

                // Passord felt (Gjenbruk)
                const CustomTextField(
                  hintText: "Passord",
                  iconPath: AppAssets.iconPassword,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}