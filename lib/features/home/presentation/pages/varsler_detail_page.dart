import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

class VarslerDetailPage extends StatelessWidget {
  const VarslerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Småviltjakt sesongen 2022/23",
                    style: GoogleFonts.aleo(
                      color: AppColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Nisi at tellus praesent ac accumsan viverra non leo fusce. Proin sem et bibendum porttitor. Faucibus nulla natoque senectus sed. Non enim tellus iaculis eget eu velit.",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Vel hendrerit adipiscing fusce aenean nulla aliquam. Lectus sed morbi tellus tellus a. At viverra libero proin et morbi convallis dignissim. Turpis volutpat molestie sed augue interdum. Vitae in id hac ut pulvinar in. Nibh faucibus aliquam tincidunt et duis tortor consequat suscipit. Et tempor ac ultrices lobortis orci metus. Tincidunt tincidunt consequat scelerisque sem.",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Sit pulvinar id felis neque auctor consequat rhoncus. Amet id morbi sit in nullam. Velit bibendum cras ullamcorper nisi. Risus morbi purus fames quis eget diam egestas. Tellus cursus vitae in urna. Nibh interdum adipiscing ac condimentum vitae. Elementum egestas.",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IntrinsicWidth(
                      child: CustomButton(
                        text: "Registrer turen",
                        btnIcon: AppAssets.vectorStrokeBlack,
                        onPressed: () {},
                        btnColor: AppColors.white,
                        textColor: AppColors.whiteBtnText,
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
