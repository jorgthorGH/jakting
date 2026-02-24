import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/list_link_items.dart';
import '../../features/auth/presentation/pages/faq.dart';
import '../../features/home/presentation/pages/jaktregler_page.dart';
import '../../features/home/presentation/pages/jaktutvalg_page.dart';
import '../../features/home/presentation/pages/terrenggrenser_gps_page.dart';

class MoreMenuSheet extends StatelessWidget {
  final Function(Widget) onNavigate;
  final VoidCallback onClose;

  const MoreMenuSheet({
    super.key,
    required this.onNavigate,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // Slightly shorter than before (about 15px less on typical phones)
      height: screenHeight * 0.80 - 15,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardBackground,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onClose,
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.primaryBtnColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                MoreLinkItem(
                  title: "Ofte stilte spørsmål",
                  onTap: () {
                    onNavigate(const Scaffold(body: MoreFaq()));
                  },
                ),
                MoreLinkItem(
                  title: "Jaktregler",
                  onTap: () {
                    onNavigate(const JaktreglerPage());
                  },
                ),
                MoreLinkItem(
                  title: "Jaktutvalg",
                  onTap: () {
                    onNavigate(const JaktutvalgPage());
                  },
                ),
                MoreLinkItem(
                  title: "Terrenggrenser til GPS",
                  onTap: () {
                    onNavigate(const TerrenggrenserGpsPage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
