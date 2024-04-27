import 'package:dio/dio.dart';

import '../models/launch.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<List<Launch>> fetchPastLaunches() async {
    try {
      final response = await _dio.get('https://api.spacexdata.com/v5/launches/past');
      if (response.statusCode == 200) {
        final List<Launch> launchList = response.data.map<Launch>((json) => Launch.fromJson(json)).toList();
        return launchList;
      } else {
        throw Exception('Error fetching data :(');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
