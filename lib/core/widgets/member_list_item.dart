import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberListItem extends StatelessWidget {
  final String name;
  final String personIconPath;
  final String trashIconPath;
  final VoidCallback onEditPressed;
  final VoidCallback onDeleteConfirmed;
  final Color bgColor;
  final Color textColor;

  const MemberListItem({
    super.key,
    required this.name,
    required this.personIconPath,
    required this.trashIconPath,
    required this.onEditPressed,
    required this.onDeleteConfirmed,
    required this.bgColor,
    required this.textColor,
  });

  Future<void> _showDeleteDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Slett $name?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          content: Text("Er du sikker på at du vil fjerne $name fra listen?", style: GoogleFonts.poppins()),
          actions: <Widget>[
            TextButton(
              child: Text("Avbryt", style: GoogleFonts.poppins(color: Colors.grey)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Slett", style: GoogleFonts.poppins(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                onDeleteConfirmed();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onEditPressed,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        personIconPath,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Image.asset(
                  trashIconPath,
                  width: 18,
                  height: 18,
                ),
                onPressed: () => _showDeleteDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}