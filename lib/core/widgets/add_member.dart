import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';

import '../constants/app_assets.dart';

class AddMember extends StatefulWidget {
  final String hintText;
  final Function(String) onAdd;

  const AddMember({super.key, required this.hintText, required this.onAdd});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final TextEditingController _controller = TextEditingController();

  void _handleAdd() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onAdd(text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Image(image: AssetImage(AppAssets.iconPerson), width: 18),
          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                  color: AppColors.greyWhite,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
              style: GoogleFonts.poppins(color: Colors.black),
              onSubmitted: (_) => _handleAdd(),
            ),
          ),
          IconButton(
            onPressed: _handleAdd,
            icon: Image(image: AssetImage(AppAssets.add), width: 20)
          ),
        ],
      ),
    );
  }
}
