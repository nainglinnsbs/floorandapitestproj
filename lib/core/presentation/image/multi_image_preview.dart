import 'dart:io';

import 'package:flutter/material.dart';

class MultiImagePreview extends StatelessWidget {
  const MultiImagePreview({
    Key? key,
    required this.images,
    this.contentPadding,
  }) : super(key: key);

  final List<File> images;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
        images.length,
        (index) {
          final image = images.elementAt(index);
          return InkWell(
            onTap: () {},
            child: Container(
              width: 150,
              height: 150,
              padding: contentPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                clipBehavior: Clip.hardEdge,
                child: Image.file(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
