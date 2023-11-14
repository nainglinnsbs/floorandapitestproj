import 'package:flutter/material.dart';

import '../../feat_core.dart';

class SingleDateWidget extends StatelessWidget {
  const SingleDateWidget({
    Key? key,
    this.dateTime,
    required this.selectedDate,
    required this.onSelected,
  }) : super(key: key);

  final DateTime? dateTime;
  final DateTime selectedDate;
  final Function(DateTime) onSelected;

  @override
  Widget build(BuildContext context) {
    final date = dateTime ?? DateTime.now();
    final dateString = date.toFormattedString('dd\nEE');

    if (selectedDate.day == dateTime?.day) {
      return InkWell(
        onTap: () {
          onSelected(date);
        },
        child: SmfContainer(
          width: 50,
          color: Theme.of(context).colorScheme.primary,
          borderRadiusAll: 4,
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              Text(
                dateString,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 1.9,
                    ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        onSelected(date);
      },
      child: SmfContainer(
        width: 50,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        borderRadiusAll: 4,
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              dateString,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onBackground,
                    height: 1.9,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
