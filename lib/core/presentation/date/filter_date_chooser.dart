import 'package:flutter/material.dart';

import '../../feat_core.dart';

class FilterDateChooser extends StatelessWidget {
  const FilterDateChooser(
      {super.key,
      required this.date,
      this.onTapPrev,
      this.onTapLabel,
      this.onTapNext,
      this.onTapIcon});

  final VoidCallback? onTapPrev;
  final VoidCallback? onTapNext;
  final VoidCallback? onTapLabel;
  final VoidCallback? onTapIcon;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onTapPrev,
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  InkWell(
                    onTap: onTapLabel,
                    child: Text(
                      date.toFormattedString('MMM, yyyy'),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: onTapNext,
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: onTapIcon,
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
