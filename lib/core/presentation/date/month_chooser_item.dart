import 'package:flutter/material.dart';

import '../../feat_core.dart';

class MonthChooserItem extends StatelessWidget {
  const MonthChooserItem({
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
    final dateString = date.toFormattedString('MMM');

    if (selectedDate.month == dateTime?.month) {
      return InkWell(
        onTap: () {
          onSelected(date);
        },
        child: Container(
          width: 50,
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 14),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
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
      child: Container(
        width: 50,
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
        ),
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
