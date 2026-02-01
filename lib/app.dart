import 'package:flutter/material.dart';
import 'package:jaktapp/features/auth/presentation/pages/reg_new_user.dart';
import 'package:jaktapp/features/auth/presentation/pages/item_overview.dart';
import 'package:jaktapp/features/auth/presentation/pages/terreng_page.dart';
import 'core/data/mock_terreng_data.dart';
import 'features/auth/presentation/pages/landing_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/user_home_page.dart';
import 'features/auth/presentation/pages/more_page.dart';
import 'features/auth/presentation/pages/faq.dart';
import 'package:jaktapp/core/utils/auth_wrapper.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}