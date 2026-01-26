import 'package:flutter/material.dart';
import 'package:jaktapp/core/constants/app_assets.dart';


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
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15), // More bottom padding
        child: Container(
          height: 65, // Match Figma height
          decoration: BoxDecoration(
            color: Colors.white, // Pure white background
            borderRadius: BorderRadius.circular(32), // More pill-shaped
          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
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
      child: SizedBox(
        width: 80, // Make tap area larger and icons more centered
        height: 80,
        child: Center(
          child: Image.asset(
            isSelected ? selectedImage : unselectedImage,
            height: 80, // Icon size
            width: 80,
          ),
        ),
      ),
    );
  }
}