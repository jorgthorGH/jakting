import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/register_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(), // Vi peker direkte til Register-siden vår
    );
  }
}