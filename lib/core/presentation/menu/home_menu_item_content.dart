import 'package:flutter/material.dart';

class HomeMenuItemContent extends StatelessWidget {
  const HomeMenuItemContent({
    Key? key,
    required this.menuLogo,
    required this.menuText,
    this.textStyle,
    this.showBottomBorder = false,
  }) : super(key: key);

  final Widget menuLogo;
  final String menuText;
  final TextStyle? textStyle;
  final bool showBottomBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        menuLogo,
        const SizedBox(height: 10),
        FittedBox(
          child: Text(
            menuText.toUpperCase(),
            style: textStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
          ),
        ),
        const SizedBox(height: 10),
        if (showBottomBorder)
          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
          ),
      ],
    );
  }
}
