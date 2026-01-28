import 'package:flutter/material.dart';
import 'package:jaktapp/features/auth/presentation/pages/register_new_person.dart';
import 'package:jaktapp/features/auth/presentation/pages/reserve_page.dart';
import 'package:jaktapp/features/auth/presentation/pages/terreng_page.dart';
import 'core/data/mock_terreng_data.dart';
import 'features/auth/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/user_home_page.dart';
import 'features/auth/presentation/pages/more_page.dart';
import 'features/auth/presentation/pages/more_faq.dart';
import 'package:jaktapp/core/utils/auth_wrapper.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReservePage(
        terreng: MockTerrengData.list[0],
      ),
    );
  }
}