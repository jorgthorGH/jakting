import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_navbar.dart';
import 'package:jaktapp/features/auth/presentation/pages/terreng_page.dart';
import 'package:jaktapp/features/auth/presentation/pages/user_home_page.dart';

import '../../../../core/widgets/more_menu_sheet.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigator> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _showMoreMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Lar den bli høyere enn halve skjermen
      backgroundColor: Colors.transparent,
      builder: (context) => MoreMenuSheet(
        onNavigate: (Widget page) {
          Navigator.pop(context);
          final activeNavigator = _navigatorKeys[_currentIndex].currentState;
          if (activeNavigator != null) {
            activeNavigator.push(
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          }
        }
      ),
    );
  }

  Widget _buildNavigator(GlobalKey<NavigatorState> key, Widget child) {
    return Navigator(
      key: key,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final NavigatorState? currentNavigator = _navigatorKeys[_currentIndex].currentState;

        if (currentNavigator != null && currentNavigator.canPop()) {
          currentNavigator.pop();
        }

        else if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
        }

        else {
          if (context.mounted) Navigator.of(context).pop();
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildNavigator(_navigatorKeys[0], const TerrengPage()),
            _buildNavigator(_navigatorKeys[1], const Center(child: Text("Varlser", style: TextStyle(color: AppColors.white)))),
            _buildNavigator(_navigatorKeys[2], const UserHomePage()),
            const SizedBox(),
          ],
        ),
        bottomNavigationBar: CustomNavbar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 3) {
              _showMoreMenu();
            } else {
              if (_currentIndex == index) {
                _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            }
          }
        ),
      ),
    );
  }
}