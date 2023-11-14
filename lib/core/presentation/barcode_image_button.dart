import 'package:flutter/material.dart';

class BarcodeImageButton extends StatelessWidget {
  const BarcodeImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 57,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconTheme(
        data: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const Icon(
          Icons.qr_code,
          size: 30,
        ),
      ),
    );
  }
}
