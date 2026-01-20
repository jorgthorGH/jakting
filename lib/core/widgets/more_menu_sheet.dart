import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/list_link_items.dart';
import '../../../../core/widgets/profile_header.dart'; // Hvis du vil ha headeren her også

class MoreMenuSheet extends StatelessWidget {
  const MoreMenuSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Vi bruker en Container for å styre bakgrunnsfarge og avrundede hjørner
    return Container(
      height: MediaQuery.of(context).size.height * 0.80, // Dekker 85% av skjermen
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),

          // --- Lukkeknapp og evt tittel ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),

          // --- Header (Valgfritt om du vil ha den inni menyen) ---
          // ProfileHeader(height: 100, logoBottomOffset: 0),

          const SizedBox(height: 10),

          // --- Listen ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                MoreLinkItem(title: "Ofte stilte spørsmål", onTap: () {}),
                MoreLinkItem(title: "Jaktregler", onTap: () {}),
                MoreLinkItem(title: "Jaktutvalg", onTap: () {}),
                MoreLinkItem(title: "Terrenggrenser til GPS", onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}