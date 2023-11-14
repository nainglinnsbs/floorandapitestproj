import 'package:flutter/material.dart';

/// Badge for status message.
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.contentPadding,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 8,
    this.fontSize = 14,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 8,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ??
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: foregroundColor ?? Theme.of(context).colorScheme.secondary,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
