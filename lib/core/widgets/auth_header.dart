import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

// Headeren som brukes av bruker som ikke er logget inn.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppAssets.jaktingHeader,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(left: 30, child: Image.asset(AppAssets.logoVector)),
      ],
    );
  }
}
