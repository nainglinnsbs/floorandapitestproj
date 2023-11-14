import 'package:flutter/material.dart';

class InputLabelField extends StatelessWidget {
  const InputLabelField({
    super.key,
    this.isRequired = false,
    required this.label,
  });
  final bool isRequired;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isRequired ? "*" : "",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18, color: Theme.of(context).colorScheme.error),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 16,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        ),
      ],
    );
  }
}
