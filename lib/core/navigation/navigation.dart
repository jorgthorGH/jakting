import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/fill_out_hunt_card.dart';
import '../../features/auth/presentation/pages/item_overview.dart';
import '../../features/auth/presentation/pages/reserve_page.dart';
import 'package:jaktapp/core/models/terreng_data.dart';
import '../../../../../core/models/terreng_data.dart';

class AppNav {
  AppNav._();

  static void navigateToHuntingCard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FillOutHuntCard()),
    );
  }

  static void navigateToReservation(
    BuildContext context,
    TerrengData terreng,
    DateTime selectedDate,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ReservePage(terreng: terreng, selectedDate: selectedDate),
      ),
    );
  }

  static void navigateToOverview(
    BuildContext context,
    TerrengData item,
    DateTime selectedDate,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ItemOverview(terreng: item, selectedDate: selectedDate),
      ),
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
