// import 'package:flutter/material.dart';
// import 'package:jaktapp/core/theme/app_colors.dart';
// import 'package:jaktapp/core/widgets/custom_navbar.dart';
// import 'package:jaktapp/features/auth/presentation/pages/update_user.dart';
// import '../../../../core/widgets/more_menu_sheet.dart';
// import '../../../auth/presentation/pages/login_page.dart';
// import '../../../auth/presentation/pages/more_page.dart';
// import '../../../auth/presentation/pages/terreng_page.dart';
// import '../../../auth/presentation/pages/user_home_page.dart';
//
// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex = 0;
//
//   // Replace these with your actual page widgets
//   final List<Widget> _pages = [
//     const TerrengPage(),
//     const _PlaceholderPage(title: "Varsler"),
//     const UserHomePage(),
//     const SizedBox(),
//   ];
//
//   void _showMoreMenu() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // Lar den bli høyere enn halve skjermen
//       backgroundColor: Colors.transparent,
//       builder: (context) => const MoreMenuSheet(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: CustomNavbar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           if (index == 3) {
//             _showMoreMenu();
//           } else {
//             setState(() {
//               _currentIndex = index;
//             });
//           }
//         },
//       ),
//     );
//   }
// }
//
// // Temporary placeholder - delete when you have real pages
// class _PlaceholderPage extends StatelessWidget {
//   final String title;
//
//   const _PlaceholderPage({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
