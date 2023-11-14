// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EmptyWithChangeImage extends StatelessWidget {
  Widget image;
  String lable;
  EmptyWithChangeImage({
    Key? key,
    required this.image,
    required this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            lable,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
