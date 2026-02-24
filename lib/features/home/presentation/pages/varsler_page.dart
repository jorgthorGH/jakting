import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';
import 'package:jaktapp/core/widgets/section_header.dart';
import 'package:jaktapp/features/home/presentation/pages/varsler_detail_page.dart';

class VarslerPage extends StatelessWidget {
  const VarslerPage({super.key});

  static const List<_ImportantMessage> _messages = [
    _ImportantMessage(
      title: "Småviltjakt sesongen 2022/23",
      date: "04.09.2023",
      body:
          "Lorem ipsum dolor sit amet consectetur. Tempor mauris tellus rhoncus volutpat. Donec adipiscing dui mattis habitasse.",
      hasAlert: true,
    ),
    _ImportantMessage(
      title: "Ny sesong kommer!",
      date: "11.12.2023",
      body:
          "Lorem ipsum dolor sit amet consectetur. Tempor mauris tellus rhoncus volutpat. Donec adipiscing dui mattis habitasse.",
    ),
    _ImportantMessage(
      title: "Ny sesong kommer!",
      date: "11.12.2023",
      body:
          "Lorem ipsum dolor sit amet consectetur. Tempor mauris tellus rhoncus volutpat. Donec adipiscing dui mattis habitasse.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader("Viktige meldinger"),
                  ...List.generate(_messages.length, (index) {
                    final message = _messages[index];
                    final card = Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _ImportantMessageCard(message: message),
                    );

                    if (index == 0) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VarslerDetailPage(),
                            ),
                          );
                        },
                        child: card,
                      );
                    }

                    return card;
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImportantMessage {
  final String title;
  final String date;
  final String body;
  final bool hasAlert;

  const _ImportantMessage({
    required this.title,
    required this.date,
    required this.body,
    this.hasAlert = false,
  });
}

class _ImportantMessageCard extends StatelessWidget {
  final _ImportantMessage message;

  const _ImportantMessageCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  message.title,
                  style: GoogleFonts.aleo(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (message.hasAlert)
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.suksess,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            message.date,
            style: GoogleFonts.poppins(
              color: AppColors.hintText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message.body,
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
