import 'package:flutter/material.dart';
import 'package:jaktapp/features/auth/presentation/pages/landing_page.dart';
import 'package:jaktapp/features/home/presentation/pages/main_navigation.dart';

import '../../features/home/presentation/pages/main_navigator.dart';

/// Wrapper that decides whether to show auth screens or main app.
/// 
/// For now, uses a simple boolean. Later, replace with your auth state
/// management (Provider, Riverpod, Bloc, etc.)
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  // TODO: Replace with real auth state management
  // For testing: set to true to see navbar, false to see login
  bool _isLoggedIn = true;

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      // User is logged in - show main app with navbar
      return const MainNavigator();
    } else {
      // User is not logged in - show login page
      return const HomePage();
    }
  }
}
