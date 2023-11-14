import 'package:flutter/material.dart';

import '../feat_core.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    Key? key,
    this.size = 40,
    this.colorFilter,
    this.menuIcon = AppAssets.appLogoTransparent,
  }) : super(key: key);

  final double size;
  final String menuIcon;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(menuIcon),
        fit: BoxFit.contain,
        colorFilter: colorFilter ?? colorFilter,
      )),
    );
  }
}
