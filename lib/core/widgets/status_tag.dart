import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  final String text;
  final String isAvailable;


  const StatusTag({
    super.key,
    required this.text,
    required this.isAvailable,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),

      ],
    );
  }
}