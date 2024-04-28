
import 'package:flutter_playrground_1/models/launch.dart';

class SortedLaunches {
  final LaunchMonth date;
  final List<Launch> launches;

  SortedLaunches(this.date, this.launches);
}

class LaunchMonth {
  final int month;
  final int year;

  LaunchMonth(this.month, this.year);
}

extension ToLaunchMonth on String {
  LaunchMonth toLaunchMonth() {
    return LaunchMonth(int.parse(substring(5, 7)), int.parse(substring(0, 4)));
  }
}
