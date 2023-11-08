import 'dart:convert';

import 'package:dio/dio.dart';

import 'client/client.dart';

class SearchService {
  final DioClient client;

  SearchService(this.client);

  Future<List<dynamic>> searchProducts(String query) async {
    final String apiUrl = '/products?query=$query'; // Replace with your API endpoint

    try {
      final res = await client.get(apiUrl);

      if (res.statusCode == 200) {
        return json.decode(res.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: apiUrl),
          error: 'Failed to load data',
          response: Response(
            requestOptions: RequestOptions(path: apiUrl),
            data: 'Failed to load data',
            statusCode: res.statusCode,
          ),
        );
      }
    } catch (e) {
      // Handle Dio errors
      throw DioException(
        requestOptions: RequestOptions(path: apiUrl),
        error: e.toString(),
      );
    }
  }
}
