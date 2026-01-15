import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hideFromStatistics = false;

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
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrer",
                  style: GoogleFonts.aleo(
                    fontSize: 28,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Navn felt
                const SizedBox(height: 30),

                const CustomTextField(
                  hintText: "Navn",
                  iconPath: AppAssets.iconPerson,
                ),
                const SizedBox(height: 30),

                // E-post felt
                const CustomTextField(
                  hintText: "E-post",
                  iconPath: AppAssets.iconEmail,
                ),

                const SizedBox(height: 30),

                // Telefon felt
                const CustomTextField(
                  hintText: "Telefon",
                  iconPath: AppAssets.iconTelefon,
                  obscureText: false,
                ),

                const SizedBox(height: 30),
                // Passord felt
                const CustomTextField(
                  hintText: "Passord",
                  iconPath: AppAssets.iconPassword,
                  obscureText: true,
                ),

                const SizedBox(height: 30),
                // Passord gjenta felt
                const CustomTextField(
                  hintText: "Passord",
                  iconPath: AppAssets.iconPassword,
                  obscureText: true,
                  smallText: "(gjenta)",
                ),

                // Checkbox med link på én linje
                const SizedBox(height: 20),

                Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(-12, 0),
                      child: Checkbox(
                        
                        value: _hideFromStatistics,
                        onChanged: (value) {
                          setState(() {
                            _hideFromStatistics = value ?? false;
                          });
                        },
                        side: const BorderSide(
                    
                          color: AppColors.white),
                        checkColor: AppColors.white,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.checkColor;
                          }
                          return AppColors.white;
                        }),
                      ),
                    ),
                    Flexible(
                      child: Transform.translate(
                        offset: const Offset(-12, 0),
                        child: GestureDetector(
                          onTap: () {
                            // Håndter link-klikk her
                          },
                          child: Text(
                            "Jeg ønsker ikke å bli vist i offentlige statistikker",
                            style: GoogleFonts.aleo(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Registrer knapp
                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    // Håndter registrering her
                  },
                  icon: Image.asset(
                    AppAssets.iconRegistrer,
                    width: 25,
                    height: 25,
                  ),

                  label: Text(
                    "Registrer",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      //fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.checkColor,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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