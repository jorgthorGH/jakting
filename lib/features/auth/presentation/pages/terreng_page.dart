import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/card_scrollable.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/scrollable_daypicker.dart';

import '../../../../core/data/mock_terreng_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

class TerrengPage extends StatelessWidget {
  const TerrengPage({super.key});

  @override
  Widget build(BuildContext context) {

    final data = MockTerrengData.list;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ProfileHeader(
            height: context.height * 0.20,
            logoBottomOffset: context.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                ScrollableDayPicker(
                  onDateSelected: (selectedDate) {
                    print("Bruker valgte: $selectedDate");
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30),

              itemCount: data.length,

              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) {
                final item = data[index];

                return CardScrollable(
                  title: item.title,
                  img: item.img,
                  isAvailable: item.isAvailable,
                  onTap: () {
                    print("${item.title} trykket");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
