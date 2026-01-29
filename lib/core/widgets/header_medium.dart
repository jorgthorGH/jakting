import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/extensions.dart';

// Headeren som vises mens bruker oppretter en brukerprofil eller skriver inn login detaljer.

class HeaderMedium extends StatelessWidget {
  final double height;
  final double logoBottomOffset;
  final double logoWidthPercent;

  const HeaderMedium({
    super.key,
    required this.height,
    this.logoBottomOffset = 30,
    this.logoWidthPercent = 0.35,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            AppAssets.jaktingHeader,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: logoBottomOffset,
            left: 30,
            child: SvgPicture.asset(
              AppAssets.logoVectorSVG,
              width: context.width * logoWidthPercent,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}