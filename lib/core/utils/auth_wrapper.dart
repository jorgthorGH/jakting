import 'package:flutter/material.dart';
import 'package:jaktapp/features/auth/presentation/pages/landing_page.dart';
import 'package:jaktapp/features/home/presentation/pages/main_navigation.dart';

import '../../features/home/presentation/pages/main_navigator.dart';


class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

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

      return const MainNavigator();
    } else {
  
      return const HomePage();
    }
  }
}
