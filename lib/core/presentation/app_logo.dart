import 'package:flutter/material.dart';

import '../feat_core.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.size = 150,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage(AppAssets.appLogoTransparent),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
