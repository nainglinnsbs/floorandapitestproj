import 'package:flutter/material.dart';

class DefaultBottomSheet extends StatelessWidget {
  final VoidCallback? onTap;
  final String bottonText;
  final String totalRecord;
  const DefaultBottomSheet(
      {Key? key,
      this.onTap,
      required this.bottonText,
      required this.totalRecord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            totalRecord.isEmpty ? '' : 'Total Record : $totalRecord',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontSize: 18),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              // width: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text(
                bottonText,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
