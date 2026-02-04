import 'package:flutter/material.dart';
import 'package:jaktapp/core/widgets/card_scrollable.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/scrollable_daypicker.dart';
import 'package:jaktapp/features/auth/presentation/pages/item_overview.dart';

import '../../../../core/data/mock_terreng_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';

class TerrengPage extends StatefulWidget {
  const TerrengPage({super.key});

  @override
  State<TerrengPage> createState() => _TerrengPageState();
}

class _TerrengPageState extends State<TerrengPage> {
  DateTime _selectedDate = DateTime.now();

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
                  onDateSelected: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                    print("Bruker valgte: $_selectedDate");
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemOverview(terreng: item, selectedDate: _selectedDate),
                      ),
                    );
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
