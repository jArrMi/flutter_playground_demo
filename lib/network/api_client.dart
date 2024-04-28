import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_playrground_1/models/launch.dart';
import 'package:flutter_playrground_1/models/rocket.dart';
import 'package:flutter_playrground_1/models/sorted_launches.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<List<SortedLaunches>> fetchPastLaunches() async {
    try {
      final response = await _dio.get('https://api.spacexdata.com/v5/launches/past');
      if (response.statusCode == 200) {
        final List<Launch> launchList =
            response.data.map<Launch>((json) => Launch.fromJson(json)).toList();
        return _groupLaunchesByMonth(launchList);
      } else {
        throw Exception('Error fetching data :(');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<SortedLaunches>> fetchUpcomingLaunches() async {
    try {
      final response = await _dio.get('https://api.spacexdata.com/v5/launches/upcoming');
      if (response.statusCode == 200) {
        final List<Launch> launchList =
            response.data.map<Launch>((json) => Launch.fromJson(json)).toList();
        return _groupLaunchesByMonth(launchList);
      } else {
        throw Exception('Error fetching data :(');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  List<SortedLaunches> _groupLaunchesByMonth(List<Launch> launchList) {
    launchList.sort((a, b) => b.date_local.compareTo(a.date_local));
    return groupBy(launchList, (Launch launch) => launch.date_local.substring(0, 7))
        .entries
        .map((entry) {
      return SortedLaunches(entry.key.toLaunchMonth(), entry.value);
    }).toList();
  }

  Future<Rocket?> fetchRocket(String id) async {
    try {
      final response = await _dio.get('https://api.spacexdata.com/v4/rockets/$id');
      if (response.statusCode == 200) {
        return Rocket.fromJson(response.data);
      } else {
        throw Exception('Error fetching data :(');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
