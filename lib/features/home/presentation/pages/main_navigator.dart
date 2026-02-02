import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_navbar.dart';
import 'package:jaktapp/features/auth/presentation/pages/terreng_page.dart';
import 'package:jaktapp/features/auth/presentation/pages/user_home_page.dart';

import '../../../../core/widgets/more_menu_sheet.dart';

// BUG: Tilstanden huskes ikke ved bruk av Mer-meny om bruker går inn på en av lenken her.
// Bruker blir tatt tilbake til Terreng-oversikten, men bør heller bli navigert tilbake
// der brukeren var. (F.eks Bår & Henger -> Reserver)

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

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildNavigator(_navigatorKeys[0], const TerrengPage()),
      _buildNavigator(_navigatorKeys[1], const Center(child: Text("Varsler", style: TextStyle(color: AppColors.white)))),
      _buildNavigator(_navigatorKeys[2], const UserHomePage()),
      const SizedBox(),
    ];
  }

  void _showMoreMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
          children: _pages,
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