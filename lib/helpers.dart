import 'package:flutter/material.dart';

final gradientColors = <Color>[
  Colors.blue,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];

String formatDate(DateTime date) {
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}
