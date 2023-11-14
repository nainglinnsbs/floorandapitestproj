import 'package:flutter/material.dart';

import '../../feat_core.dart';

class DateSwitcher extends StatefulWidget {
  const DateSwitcher({
    super.key,
    required this.onDateChange,
  });

  final Function(DateTime selectedDate) onDateChange;

  @override
  State<DateSwitcher> createState() => _DateSwitcherState();
}

class _DateSwitcherState extends State<DateSwitcher> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              final yesterday = _selectedDate.subtract(const Duration(days: 1));
              setState(() {
                _selectedDate = yesterday;
              });
              widget.onDateChange(yesterday);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          Text(
            _selectedDate.toFormattedString('dd MMMM, yyyy'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: () {
              final tmr = _selectedDate.add(const Duration(days: 1));
              setState(() {
                _selectedDate = tmr;
              });
              widget.onDateChange(tmr);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
