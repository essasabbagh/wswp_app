import 'package:dio/dio.dart';
import 'package:wswp_app/constants/enums.dart';

import '../interfaces/data_interface.dart';
import '../models/category.dart';
import '../models/product.dart';
import 'client/client.dart';

class SearchService {
  final DioClient client;

  SearchService(this.client);

  Future<DataModel> fetchData(DataInterface data) async {
    String apiUrl =
        '/mob_api/v1/search?key_word=${data.query}&paged=${data.paged}&lang=${data.lang}';
    if (data.productType != ProductType.all) {
      apiUrl += '&type=${data.productType.type}';
    }
    if (data.techType != 'all') {
      apiUrl += '&tech_type=${data.techType}';
    }

    // Replace with your API endpoint

    try {
      final res = await client.get(apiUrl);

      if (res.statusCode == 200) {
        return DataModel.fromJson(res.data);
        // return json.decode(res.data);
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

  Future<CategoryModel> fetchCategory(String lang) async {
    String apiUrl = '/mob_api/v1/categories?lang=$lang';
    try {
      final res = await client.get(apiUrl);

      if (res.statusCode == 200) {
        return CategoryModel.fromJson(res.data);
        // return json.decode(res.data);
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
