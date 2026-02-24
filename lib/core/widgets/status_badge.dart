import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusRow extends StatelessWidget {
  final String text;
  final Color dotColor;

  const StatusRow({
    super.key,
    this.text = "Reservert av deg",
    this.dotColor = Colors.green
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(width: 6),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}