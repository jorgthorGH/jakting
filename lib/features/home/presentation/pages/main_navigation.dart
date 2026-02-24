// Deprecated: the app now uses MainNavigator as the primary
// navigation shell (see lib/features/home/presentation/pages/main_navigator.dart).
// This file is kept only for historical reference and is no longer used.

// ignore_for_file: unused_import, dead_code

import 'package:flutter/material.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/custom_navbar.dart';
import 'package:jaktapp/features/auth/presentation/pages/update_user.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../auth/presentation/pages/user_home_page.dart';

@deprecated
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirect to the root (AuthWrapper -> MainNavigator) if someone
    // still navigates here. Using pushReplacementNamed avoids keeping
    // this page on the navigation stack.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed('/');
    });

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
