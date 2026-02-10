import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import '../utils/extensions.dart';
import 'add_member.dart';
import 'custom_button.dart';

class GuestCard extends StatefulWidget {
  const GuestCard({super.key});

  @override
  State<GuestCard> createState() => _GuestCardState();
}

class _GuestCardState extends State<GuestCard> {
  final List<String> guests = ["Ole Nordmann"]; // Placeholder

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(color: AppColors.guestCardBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            "Gjestejegere",
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Fyll inn navn på gjestejegere",
            style: GoogleFonts.poppins(
              color: AppColors.greyWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),

          ...guests.map((name) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomButton(
                width: double.infinity,
                text: name,
                btnIcon: AppAssets.iconPerson,
                secondaryBtnIcon: AppAssets.trashIcon,
                iconSize: 18,
                btnColor: AppColors.secondaryBtnColor,
                textColor: AppColors.white,

                onPressed: () {
                  setState(() {
                    guests.remove(name);
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
                guests.add(newName);
              });
            },
          ),
        ],
      ),
    );
  }
}