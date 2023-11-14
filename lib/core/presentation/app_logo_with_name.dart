import 'package:flutter/material.dart';

import '../feat_core.dart';

class AppLogoWithName extends StatelessWidget {
  const AppLogoWithName({
    Key? key,
    this.size = 150,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogo(size: size),
        const SizedBox(height: 10),
        Text(
          AppStrings.luckyDiamondMyanmar,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
