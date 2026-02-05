import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../utils/extensions.dart';

// Klassen oppretter en horisontalt scrollbar datovelger. Brukes i terreng- og utstyroversikten.

class ScrollableDayPicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const ScrollableDayPicker({super.key, required this.onDateSelected});

  @override
  State<ScrollableDayPicker> createState() => _ScrollableDayPickerState();
}

class _ScrollableDayPickerState extends State<ScrollableDayPicker> {
  DateTime _selectedDate = DateTime.now(); // Default

  late List<DateTime> _weekDates;
  late int _weekNumber;

  @override
  void initState() {
    super.initState();
    _generateCurrentWeek();
  }

  void _generateCurrentWeek() {
    final now = DateTime.now();

    _weekDates = List.generate(7, (index) {
      return now.add(Duration(days: index));
    });

    _weekNumber = _getWeekNumber(now);
  }

  int _getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(
      "${date.difference(DateTime(date.year, 1, 1, 0, 0)).inDays + 1}",
    );
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Våre terreng",
                style: GoogleFonts.aleo(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Uke $_weekNumber",
                style: GoogleFonts.poppins(
                  color: Color(0xFF656565),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: context.height * 0.03,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _weekDates.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final date = _weekDates[index];
              final isSelected = _isSameDay(date, _selectedDate);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onDateSelected(date);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryBtnColor
                        : const Color(0xFF353535),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _formatDate(date),
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Hjelper for å sjekke om to datoer er samme dag (ignorerer klokkeslett)
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  // Hjelper for å formatere teksten (f.eks "30.11 Tor.")
  // Du kan bruke 'intl' pakken, men her er en manuell måte for å slippe imports
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final weekDayNames = ['Man.', 'Tir.', 'Ons.', 'Tor.', 'Fre.', 'Lør.', 'Søn.'];
    final dayName = weekDayNames[date.weekday - 1];

    return "$day.$month $dayName";
  }
}
