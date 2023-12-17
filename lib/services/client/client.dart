import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constants.dart';

/// Create a singleton class to contain all Dio methods and helper functions
class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(milliseconds: timeout),
      connectTimeout: const Duration(milliseconds: timeout),
      sendTimeout: const Duration(milliseconds: timeout),
      followRedirects: false,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'wswp_auth <4yDku+aCv\\mafWGVoY4Leih2!E2NSGVvKZh6Md*weNBoo/ihPGUrDW862c33ARc_Sj*m7Qo=Ggfczsa!xESGCmihs97b!F_NmVEJfQ9KCoUGfo!QpPzW8B_zJHRXkH5'
      },
    ),
  )..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

  ///Get Method
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) return response;
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }

  ///Post Method
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      }
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }

  ///Put Method
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) return response.data;

      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }

  ///Delete Method
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) return response;
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }
}
