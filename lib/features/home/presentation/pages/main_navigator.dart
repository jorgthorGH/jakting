import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_navbar.dart';
import 'package:jaktapp/features/auth/presentation/pages/terreng_page.dart';
import 'package:jaktapp/features/auth/presentation/pages/user_home_page.dart';
import 'package:jaktapp/features/home/presentation/pages/varsler_page.dart';

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
  // Which tab's content is shown in the body
  int _currentIndex = 0;

  // Which icon is highlighted in the navbar
  int _navIndex = 0;

  // Which icon was selected before opening the More menu
  int _previousNavIndex = 0;

  // Whether the More overlay is visible
  bool _isMoreOpen = false;

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
      _buildNavigator(_navigatorKeys[1], const VarslerPage()),
      _buildNavigator(_navigatorKeys[2], const UserHomePage()),
      const SizedBox(),
    ];
  }

  void _openMoreMenu() {
    setState(() {
      _previousNavIndex = _navIndex;
      _isMoreOpen = true;
      _navIndex = 3;
    });
  }

  void _closeMoreMenu({bool restorePrevious = true}) {
    setState(() {
      _isMoreOpen = false;
      if (restorePrevious && _navIndex == 3) {
        _navIndex = _previousNavIndex;
      }
    });
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

        final NavigatorState? currentNavigator =
            _navigatorKeys[_currentIndex].currentState;

        if (currentNavigator != null && currentNavigator.canPop()) {
          currentNavigator.pop();
        } else if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
        } else {
          if (context.mounted) Navigator.of(context).pop();
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            IndexedStack(index: _currentIndex, children: _pages),
            if (_isMoreOpen) ...[
              // Dark scrim over content but under navbar
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => _closeMoreMenu(),
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              // The More overlay sheet
              Align(
                alignment: Alignment.bottomCenter,
                child: MoreMenuSheet(
                  onNavigate: (Widget page) {
                    _closeMoreMenu(restorePrevious: false);
                    final activeNavigator =
                        _navigatorKeys[_currentIndex].currentState;
                    if (activeNavigator != null) {
                      activeNavigator.push(
                        MaterialPageRoute(builder: (context) => page),
                      );
                    }
                  },
                  onClose: () => _closeMoreMenu(),
                ),
              ),
            ],
          ],
        ),
        bottomNavigationBar: CustomNavbar(
          currentIndex: _navIndex,
          onTap: (index) {
            if (index == 3) {
              _openMoreMenu();
            } else {
              if (_isMoreOpen) {
                _closeMoreMenu();
              }
              if (_currentIndex == index) {
                setState(() {
                  _navIndex = index;
                });
                _navigatorKeys[index].currentState?.popUntil(
                  (route) => route.isFirst,
                );
              } else {
                setState(() {
                  _currentIndex = index;
                  _navIndex = index;
                });
              }
            }
          },
        ),
      ),
    );
  }
}
