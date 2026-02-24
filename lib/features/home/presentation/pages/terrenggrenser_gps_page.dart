import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

class TerrenggrenserGpsPage extends StatelessWidget {
  const TerrenggrenserGpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrenggrenser til GPS',
                    style: GoogleFonts.aleo(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Det første du gjør er å installere Mapsource på PCèn , deretter laster du ned fila med grensene og legger den på skrivebordet ditt. Koble GPSèn til PCèn uten å skru GPSèn på.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Åpne så Mapsource, trykk på fil og hent fila med grensene fra skrivebordet ditt, Sjekk at grensene har lagt seg inn på mapsource. Når dette er gjort så trykker du på symbolet "send til enhet" som ligger øverst i skjermbildet i Mapsource. Da vil det poppe opp et skjermbilde der du skal trykke på "Finn enhet". Når maskinen har funnet GPSèn din så trykker du på send og da vil terrenggrensene bli lagt inn på din GPS.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Du kan nå koble GPSèn fra PCèn. Har du Astro 220 vil grensene komme frem på kartet av seg selv. Har du Astro 320 så må du gå inn på "spor" og trykke på "vis på kart" for å få grensene synlige på karta. Dette må gjøres med alle 27 spor som ligger der. Når du har gjort det så vil også Astro 320 være klar til bruk.',
                    style: GoogleFonts.poppins(
                      color: AppColors.greyWhite,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Terrenggrenser GPS',
                      btnIcon: AppAssets.gpsIcon,
                      onPressed: () {},
                      btnColor: AppColors.white,
                      textColor: AppColors.whiteBtnText,
                      width: double.infinity,
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
