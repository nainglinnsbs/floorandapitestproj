import 'package:flutter/material.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
          ),
          child: const Text('See all'),
        ),
      ],
    );
  }
}
