import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/models/launch.dart';
import 'package:flutter_playrground_1/network/api_client.dart';

class LaunchProvider extends ChangeNotifier {
  List<Launch> _launches = [];
  bool _isLoading = true;

  List<Launch> get launches => _launches;
  bool get isLoading => _isLoading;

  LaunchProvider() {
    fetchLaunches();
  }

  Future<void> fetchLaunches() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _launches = await apiClient.fetchLaunchList();

    _isLoading = false;
    notifyListeners();
  }
}
