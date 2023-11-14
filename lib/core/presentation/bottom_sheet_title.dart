import 'package:flutter/material.dart';

class BottomSheetTitle extends StatelessWidget {
  final String title;
  const BottomSheetTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 50,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
