import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.enabled,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.decoration,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onSaved,
    this.textDirection,
    this.strutStyle,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.focusNode,
    this.showCursor,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool readOnly;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool? showCursor;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      textDirection: textDirection,
      textInputAction: textInputAction,
      style: style ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18,
              ),
      textAlign: textAlign,
      strutStyle: strutStyle,
      focusNode: focusNode,
      showCursor: showCursor,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      decoration: decoration ??
          InputDecoration(
            fillColor: Theme.of(context).colorScheme.secondaryContainer,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: label,
          ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
    );
  }
}
