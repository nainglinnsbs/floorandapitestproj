import 'package:flutter/material.dart';

import '../../feat_core.dart';

class MonthChooser extends StatefulWidget {
  const MonthChooser({
    super.key,
    this.firstDate,
    this.lastDate,
    required this.selectedDate,
    required this.onDateSelected,
    this.showMonthRow = false,
  });

  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime selectedDate;
  final Function(DateTime selectedDate) onDateSelected;
  final bool showMonthRow;

  @override
  State<MonthChooser> createState() => _MonthChooserState();
}

class _MonthChooserState extends State<MonthChooser> {
  late ScrollController _scrollController;
  bool _isDateRowShow = true;

  // final List<GlobalKey> keys = List.generate(12, (index) => GlobalKey());

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _scrollController = ScrollController();
  }

  void changeDateIndex(DateTime date, int index) {
    widget.onDateSelected(date);

    // final dataKey = keys[index];
    // Scrollable.ensureVisible(dataKey.currentContext!);
    // moveScrollCenter();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showYearPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: widget.firstDate ?? DateTime(1900),
              lastDate: widget.lastDate ?? DateTime(3000),
              initialDate: widget.selectedDate,
              selectedDate: widget.selectedDate,
              onChanged: (DateTime selectedDate) {
                widget.onDateSelected(selectedDate);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  void showDatePickerDialog() async {
    final selectedDate = await showAnimatedDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(3000),
      // initialDatePickerMode: DatePickerMode.year,
    );
    if (selectedDate != null) {
      widget.onDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          final dateTime = widget.selectedDate;
                          final firstDateOfMonth =
                              DateTime(dateTime.year, dateTime.month, 1);
                          final subDate = firstDateOfMonth
                              .subtract(const Duration(days: 1));
                          widget.onDateSelected(subDate);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      InkWell(
                        onTap: showDatePickerDialog,
                        child: Text(
                          widget.selectedDate.toFormattedString('MMM, yyyy'),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final dateTime = widget.selectedDate;
                          final firstDateOfMonth =
                              DateTime(dateTime.year, dateTime.month + 1, 0);
                          final addDate =
                              firstDateOfMonth.add(const Duration(days: 1));
                          widget.onDateSelected(addDate);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: showDatePickerDialog,
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                    if (widget.showMonthRow) const SizedBox(width: 5),
                    if (widget.showMonthRow)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isDateRowShow = !_isDateRowShow;
                          });
                        },
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return RotationTransition(
                              turns: child.key == const ValueKey(1)
                                  ? Tween<double>(begin: 0, end: 1)
                                      .animate(animation)
                                  : Tween<double>(begin: 1, end: 0)
                                      .animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: _isDateRowShow
                              ? const Icon(
                                  Icons.close,
                                  key: ValueKey(1),
                                )
                              : const Icon(
                                  Icons.expand_more,
                                  key: ValueKey(2),
                                ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.showMonthRow && _isDateRowShow) const Divider(),
          if (widget.showMonthRow && _isDateRowShow) const SizedBox(height: 10),
          if (widget.showMonthRow)
            AnimatedSlide(
              offset: _isDateRowShow ? Offset.zero : const Offset(0, -2),
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                opacity: _isDateRowShow ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Visibility(
                  visible: _isDateRowShow,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    child: Row(
                      children: List.generate(
                        12,
                        (index) {
                          final today = DateTime.now();
                          final dateTime = DateTime(today.year, index + 1);

                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: MonthChooserItem(
                              // key: keys[index],
                              dateTime: dateTime,
                              selectedDate: widget.selectedDate,
                              onSelected: (date) =>
                                  changeDateIndex(date, index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
