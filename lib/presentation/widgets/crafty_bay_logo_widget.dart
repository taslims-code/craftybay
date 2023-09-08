import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/utility/image_assets.dart';

class CraftyBayLogoWidget extends StatelessWidget {
  const CraftyBayLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        ImageAssets.craftyBayLogoSvg,
        width: 100,
      ),
    );
  }
}
