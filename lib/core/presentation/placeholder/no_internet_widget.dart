import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    Key? key,
    this.message,
    this.onPressed,
  }) : super(key: key);

  final String? message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 80,
          color: Theme.of(context).colorScheme.onSurface.withAlpha(70),
        ),
        const SizedBox(height: 10),
        Text(
          message ?? 'No internet connection.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (onPressed != null) const SizedBox(height: 10),
        if (onPressed != null)
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
            ),
            child: const Text('Try Again'),
          ),
      ],
    );
  }
}
