import 'package:flutter/material.dart';

import '../../feat_core.dart';

class AppStateButton extends StatefulWidget {
  const AppStateButton({
    Key? key,
    required this.text,
    this.loading = false,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool loading;
  final VoidCallback? onPressed;
  final double? padding;

  @override
  State<AppStateButton> createState() => _AppStateButtonState();
}

class _AppStateButtonState extends State<AppStateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(
          vertical: widget.padding ?? 20,
        ),
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConsts.buttonRadius),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          Positioned(
            right: 16,
            child: widget.loading
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                      strokeWidth: 1.4,
                    ),
                  )
                : ClipOval(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 18,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
