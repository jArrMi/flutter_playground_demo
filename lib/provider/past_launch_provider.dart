import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/network/api_client.dart';
import 'package:flutter_playrground_1/provider/base/launch_provider.dart';

import '../models/sorted_launches.dart';

class PastLaunchProvider extends ChangeNotifier implements LaunchProvider {
  List<SortedLaunches> _pastLaunches = [];
  bool _isLoading = true;

  @override
  List<SortedLaunches> get launches => _pastLaunches;

  @override
  bool get isLoading => _isLoading;

  PastLaunchProvider() {
    fetchLaunches();
  }

  @override
  Future<void> fetchLaunches() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _pastLaunches = await apiClient.fetchPastLaunches();

    _isLoading = false;
    notifyListeners();
  }
}
