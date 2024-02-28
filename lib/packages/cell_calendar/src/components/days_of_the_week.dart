import 'package:tobetomobileapp/packages/cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

/// Default days of the week
const List<String> _DaysOfTheWeek = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fry',
  'Sat'
];

/// Show the row of text from [_DaysOfTheWeek]
class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek(this.daysOfTheWeekBuilder, {super.key});

  final DaysBuilder? daysOfTheWeekBuilder;

  Widget defaultLabels(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        _DaysOfTheWeek[index],
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        7,
        (index) {
          return Expanded(
            child: daysOfTheWeekBuilder?.call(index) ?? defaultLabels(index),
          );
        },
      ),
    );
  }
}
