import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_playrground_1/models/sorted_launches.dart';
import 'package:flutter_playrground_1/utils/formatters.dart';

import '../models/launch.dart';

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
    launchList.sort((a, b) => b.date_utc.compareTo(a.date_utc));
    return groupBy(launchList, (Launch launch) => launch.date_utc.substring(0, 7))
        .entries
        .map((entry) {
      return SortedLaunches(entry.key.toLaunchMonth(), entry.value);
    }).toList();
  }
}
