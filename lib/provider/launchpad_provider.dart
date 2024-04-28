import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/models/launchpad.dart';
import 'package:flutter_playrground_1/network/api_client.dart';

class LaunchpadProvider extends ChangeNotifier {
  final String launchpadId;

  LaunchpadProvider({required this.launchpadId}) {
    fetchLaunchpads();
  }

  Launchpad? _launchpad;

  Launchpad? get launchpad => _launchpad;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchLaunchpads() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _launchpad = await apiClient.fetchLaunchpad(launchpadId);

    _isLoading = false;
    notifyListeners();
  }
}
