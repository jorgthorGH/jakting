import 'package:flutter/material.dart';

extension MediaUtils on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension DateExtensions on DateTime {
  String get toNorwegianDate {
    final d = day.toString().padLeft(2, '0');
    final m = month.toString().padLeft(2, '0');
    return "$d.$m.$year";
  }
}