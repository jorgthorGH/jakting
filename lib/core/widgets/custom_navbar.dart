import 'package:flutter/material.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';

// Foreløpig navbar i bunn av skjermen. Skal mulig byttes? Laget av Khalif.
class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Black strip behind the floating white navbar, matching design
      color: AppColors.background,
      // Larger side margins so the pill sits further from the edges.
      // Bottom padding to control vertical position of the pill.
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 6),
      child: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greyWhite,
            borderRadius: BorderRadius.circular(40),
          ),
          // Small top padding so icons sit close to top edge of pill
          padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavBarItem(
                selectedImage: AppAssets.terrengNav,
                unselectedImage: AppAssets.terrengIkkeValgt,
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavBarItem(
                selectedImage: AppAssets.varslerNav,
                unselectedImage: AppAssets.varslerIkkeValgt,
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavBarItem(
                selectedImage: AppAssets.minSideNav,
                unselectedImage: AppAssets.minSideIkkeValgt,
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavBarItem(
                selectedImage: AppAssets.merNav,
                unselectedImage: AppAssets.merIkkeValgt,
                isSelected: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String selectedImage;
  final String unselectedImage;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.selectedImage,
    required this.unselectedImage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        child: Image.asset(
          isSelected ? selectedImage : unselectedImage,
          height: 52,
        ),
      ),
    );
  }
}
