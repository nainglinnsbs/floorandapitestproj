import 'package:flutter/material.dart';

import 'home_menu_item_content.dart';

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({
    Key? key,
    required this.logo,
    required this.text,
    this.onTap,
    this.borderWidth,
    this.radius,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  final Widget logo;
  final String text;
  final VoidCallback? onTap;
  final double? borderWidth;
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(0),
      child: ClipPath(
        clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(7),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xff1a6fcf),
            //border: Border(
            //  top: BorderSide(
            //     color: Theme.of(context).colorScheme.primary, width: 1.0),
            //),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
              const BoxShadow(
                color: Color(0xff1a6fcf),
                offset: Offset(-5, 0),
              ),
              // ignore: prefer_const_constructors
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(5, 0),
              )
            ],
          ),
          child: HomeMenuItemContent(
            menuLogo: logo,
            menuText: text,
          ),
        ),
      ),
    );
  }
}
