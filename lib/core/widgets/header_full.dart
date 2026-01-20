import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/extensions.dart';

class HeaderFull extends StatelessWidget {
  final double height;
  final double logoBottomOffset;
  final double logoWidthPercent;

  const HeaderFull({
    super.key,
    required this.height,
    this.logoBottomOffset = 30,
    this.logoWidthPercent = 0.65,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.jaktingHeaderFull,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: logoBottomOffset,
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset(
                AppAssets.logoVectorSVG,
                width: context.width * logoWidthPercent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}