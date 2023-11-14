import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  final VoidCallback? onCalenderTap;
  final VoidCallback? onForwardTap;
  final VoidCallback? onBackwardTap;
  final String selectedDate;
  const DateTimeWidget(
      {Key? key,
      required this.selectedDate,
      this.onCalenderTap,
      this.onForwardTap,
      this.onBackwardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onCalenderTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      size: 22,
                      // color: AppColors.primary,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    // Date selector
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(selectedDate,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          // Previous
          InkWell(
            onTap: onForwardTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  // color: AppColors.primary,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          // Next button
          InkWell(
            onTap: onBackwardTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  // color: AppColors.primary,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
