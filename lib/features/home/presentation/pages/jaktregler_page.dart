import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

class JaktreglerPage extends StatelessWidget {
  const JaktreglerPage({super.key});

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
                    'Jaktregler',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 25),

                  _buildRuleItem(
                    1,
                    'For jaktkort kan utstedes må alle som skal drive jakt i Skien JFF\'s terreng fremvise betalt vilttryggavgift og medlemskort i foreningen Jaktkort fås kjøpt på foreningens annonserte jaktmøte og etter avtale med medlemmer av jaktutvalget.',
                  ),

                  const SizedBox(height: 25),

                  _buildRuleItem(
                    2,
                    'Alle som løser jaktkort eller jakter i foreningens terreng plikter å sette seg inn i nasjonale og lokale regler for fredning av vilt og hvilke arter som er jaktbare. All bruk av våpen skal utøves i samsvar med våpenloven og retningslinjer for sikker jegeradferd og human jakt. Skien JFF vil rapportere alle brudd på offentlige lover til lokalt politi.',
                  ),

                  const SizedBox(height: 25),

                  _buildRuleItem(
                    3,
                    'For jakt på lørdag og søndag må terrenget bestilles innen onsdag kl 16.00 på foreningens jaktportal på nett. En oppgir da hvilke terreng en ønsker. På grunnlag av dette og tidligere tidelinger fordeler jaktutvalget terreng. Står flere likt med hensyn til tildeling foretas loddtrekning. Dersom det tas hensyn til dugnadspoeng, vil dette være annonsert på jaktmøter eller ved kjøp av jaktkort.',
                  ),

                  const SizedBox(height: 25),

                  _buildRuleItem(
                    4,
                    'Ved jakt på hverdager må jegeren selv reservere et ledig terreng på foreningens jaktportal på nett, fylle ut terrengkort og motta SMS på mobil som må medbringes ut i felten i tilfelle kontroll. Terrengkort kan ikke skrives ut tidligere enn 3 dager før terreng skal benyttes. Dersom det er ledige terreng kommende helg kan disse også reserveres. Reserverte datoer blir synlig på nett for andre jegere, og kan ikke kreves byttet eller fjernet.',
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleItem(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              '$number',
              style: GoogleFonts.poppins(
                color: AppColors.hintText.withOpacity(0.5),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 4,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.hintText.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: AppColors.greyWhite.withOpacity(0.8),
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
