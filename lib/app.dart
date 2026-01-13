import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Vi peker direkte til Login-siden vår
    );
  }
}