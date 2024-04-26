import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<void> fetchData() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        print('Data fetched successfully: ${response.data}');
      } else {
        print('Error occurred while fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}
