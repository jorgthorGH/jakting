import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/widgets/add_member.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/section_header.dart';

import '../theme/app_colors.dart';
import '../utils/extensions.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  final List<String> members = ["Ola Nordmann", "Karl Nordmann"]; // Placeholder

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(color: AppColors.memberCardBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            "Andre medlemmer",
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "som deltar på jakten",
            style: GoogleFonts.poppins(
              color: AppColors.greyWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),

          ...members.map((name) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomButton( // Bør byttes til en sekundær knapp for å unngå uønsket oppførsel (Slett on pressed). Bør slettes kun ved trykk på trashIcon
                width: double.infinity,
                text: name,
                btnIcon: AppAssets.iconPerson,
                secondaryBtnIcon: AppAssets.trashIcon,
                iconSize: 18,
                btnColor: AppColors.secondaryBtnColor,
                textColor: AppColors.white,

                onPressed: () {
                  setState(() {
                    members.remove(name);
                  });
                },
              ),
            );
          }),

          const SizedBox(height: 20),

          AddMember(
            hintText: "Navn på medlem",
            onAdd: (newName) {
              setState(() {
                members.add(newName);
              });
            },
          ),
        ],
      ),
    );
  }
}
