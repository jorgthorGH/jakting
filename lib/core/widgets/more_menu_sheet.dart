import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/list_link_items.dart';
import '../../../../core/widgets/profile_header.dart';
import '../../features/auth/presentation/pages/faq.dart';

// Den faktiske mer-siden. Åpnes når en bruker trykker på "Mer" i navbar.

class MoreMenuSheet extends StatelessWidget {
  final Function(Widget) onNavigate;

  const MoreMenuSheet({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
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

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                MoreLinkItem(title: "Ofte stilte spørsmål", onTap: () {
                  onNavigate(const Scaffold(body: MoreFaq()));
                }),
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