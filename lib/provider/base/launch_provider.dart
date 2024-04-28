import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/models/sorted_launches.dart';

abstract class LaunchProvider extends ChangeNotifier {
  List<SortedLaunches> get launches;
  bool get isLoading;

  Future<void> fetchLaunches();
}
