import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

class JaktutvalgPage extends StatelessWidget {
  const JaktutvalgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skien Jeger- og\nFiskerforening`s jaktterreng',
                    style: GoogleFonts.aleo(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Dette er en side hvor man kan reservere/søke på terreng. Terrengene kan reserveres for 1 døgn. For å kunne bruke den nettbaserte reservasjonsløsningen må man opprette bruker og logge seg inn i boksen til høyre på siden. Når man er innlogget får man tilgang til å reservere terreng av jaktutvalget. Dette får man ikke før man har kjøpt jaktkort og kan ta opptil et døgn.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Det kan jaktes alt av småvilt, rådyr og smårovvilt når man har kjøpt jaktkort. Jakten administreres av Skien JFF sitt jaktutvalg. For kjøp av kort må man henvende seg til jaktutvalget på telefon: 92 05 95 01. Løsningen er tilgjengelig fra 10.09–28.02. For jakt utenom dette på f.eks. bever eller mårfangst må jaktutvalget kontaktes.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'For hundetrening fra 21.08 og frem til jaktstart kontaktes jaktutvalget. Skien JFF har flere terrenger ledige til trening av hund.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
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
