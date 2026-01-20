import 'package:flutter/material.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';

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
      decoration: BoxDecoration(
        color: AppColors.greyWhite,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Image.asset(
          isSelected ? selectedImage : unselectedImage,
          height: 40,
        ),
      ),
    );
  }
}
