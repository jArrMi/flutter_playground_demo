import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/models/launch.dart';
import 'package:flutter_playrground_1/network/api_client.dart';

import '../models/sorted_launches.dart';

class LaunchProvider extends ChangeNotifier {
  List<SortedLaunches> _launches = [];
  bool _isLoading = true;

  List<SortedLaunches> get launches => _launches;
  bool get isLoading => _isLoading;

  LaunchProvider() {
    fetchLaunches();
  }

  Future<void> fetchLaunches() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _launches = await apiClient.fetchPastLaunches();

    _isLoading = false;
    notifyListeners();
  }
}
