import 'package:flutter/material.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            // color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
          ),
    );
  }
}
