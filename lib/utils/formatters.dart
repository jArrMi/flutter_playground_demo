import 'package:flutter_playrground_1/models/sorted_launches.dart';
import 'package:intl/intl.dart';

extension DateFormatting on String {
  static final _dateFormatter = DateFormat('MMM dd, yyyy, hh:mm a');

  String formattedDate() {
    return _dateFormatter.format(DateTime.parse(this));
  }
}

extension LaunchMonthFormatter on LaunchMonth {
  String toFormattedString() {
    if (year == DateTime.now().year) {
      return DateFormat('MMMM').format(DateTime(0, month));
    } else {
      return '${DateFormat('MMMM').format(DateTime(0, month))} $year';
    }
  }
}
