import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/list_link_items.dart';
import '../../../../core/widgets/profile_header.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerHeight = context.height * 0.20;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              height: headerHeight,
              logoBottomOffset: context.height * 0.04,
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color:AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                MoreLinkItem(
                  title: "Ofte stilte spørsmål",
                  onTap: () {},
                ),
                MoreLinkItem(
                  title: "Jaktregler",
                  onTap: () {},
                ),
                MoreLinkItem(
                  title: "Jaktutvalg",
                  onTap: () {},
                ),
                MoreLinkItem(
                  title: "Terrenggrenser til GPS",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
