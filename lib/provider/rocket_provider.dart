import 'package:flutter/foundation.dart';
import 'package:flutter_playrground_1/models/rocket.dart';
import 'package:flutter_playrground_1/network/api_client.dart';

class RocketProvider extends ChangeNotifier {
  final String rocketId;

  RocketProvider({required this.rocketId}) {
    fetchRockets();
  }

  Rocket? _rocket;
  Rocket? get rocket => _rocket;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRockets() async {
    _isLoading = true;
    notifyListeners();

    ApiClient apiClient = ApiClient();
    _rocket = await apiClient.fetchRocket(rocketId);

    _isLoading = false;
    notifyListeners();
  }
}
