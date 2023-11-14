import 'package:flutter/material.dart';

import '../../feat_core.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
    this.image,
    this.message,
  }) : super(key: key);

  final String? image;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: context.mqHeight / 3,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image ?? AppAssets.appLogoTransparent),
              fit: BoxFit.contain,
              opacity: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          message ?? 'No data found.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
