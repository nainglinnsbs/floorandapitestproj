import 'package:flutter/material.dart';
import '../../feat_core.dart';

class DateInfoTile extends StatelessWidget {
  const DateInfoTile({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final day = date.day;
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final weekDay = date.toFormattedString('EEEE');
    final weekDayString = day == today.day
        ? 'Today ($weekDay)'
        : day == yesterday.day
            ? 'Yesterday ($weekDay)'
            : date.toFormattedString('EEEE');

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Text(date.toFormattedString('dd')),
        ),
        title: Text(weekDayString),
        subtitle: Text(
          date.toFormattedString('MMMM, yyyy'),
        ),
      ),
    );
  }
}
