import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/network/api_client.dart';
import 'package:flutter_playrground_1/provider/base/launch_provider.dart';

import '../models/sorted_launches.dart';

class UpcomingLaunchProvider extends ChangeNotifier implements LaunchProvider {
  List<SortedLaunches> _upcomingLaunches = [];
  bool _isLoading = true;

  @override
  List<SortedLaunches> get launches => _upcomingLaunches;

  @override
  bool get isLoading => _isLoading;

  UpcomingLaunchProvider() {
    fetchLaunches();
  }

  @override
  Future<void> fetchLaunches() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _upcomingLaunches = await apiClient.fetchUpcomingLaunches();

    _isLoading = false;
    notifyListeners();
  }
}
