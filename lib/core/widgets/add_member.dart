import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final FocusNode _focusNode = FocusNode();

  bool _isActive = false;

  void _handleAdd() {
    if (!_isActive) {
      setState(() {
        _isActive = true;
      });
      Future.delayed(const Duration(milliseconds: 50), () {
        _focusNode.requestFocus();
      });
    } else {
      final text = _controller.text.trim();
      if (text.isNotEmpty) {
        widget.onAdd(text);
        _controller.clear();
      } else {
        setState(() {
          _isActive = false;
        });
        _focusNode.unfocus();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Opacity(
            opacity: _isActive ? 1.0 : 0.5,
            child: Image(image: AssetImage(AppAssets.iconPerson), width: 18),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: _isActive,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
              style: GoogleFonts.poppins(color: _isActive ? Colors.black : Colors.grey),
              onSubmitted: (_) => _handleAdd(),
            ),
          ),

          GestureDetector(
            onTap: _handleAdd,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: _isActive
                    ? const Color(0xFF8DB688)
                    : Colors.grey,
                shape: BoxShape.circle,
              ),

              alignment: Alignment.center,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
