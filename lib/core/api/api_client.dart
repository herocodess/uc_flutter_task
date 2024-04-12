import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/config.dart';
import 'package:uc_flutter_task/core/storage/shared_prefs.dart';
import 'package:uc_flutter_task/core/utils/constants.dart';
import 'package:uc_flutter_task/core/utils/logger.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref: ref));

class ApiClient {
  Ref ref;
  ApiClient({Dio? dio, required this.ref})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: Config.baseUrl,
                connectTimeout: const Duration(milliseconds: 15000),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                },
              ),
            )
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (options, handler) {
                if (kDebugMode) {
                  Console.log('', {
                    'type': 'request',
                    'url': options.uri,
                    'method': options.method,
                    'headers': options.headers,
                    'data': options.data,
                  });
                }
                return handler.next(options);
              },
              onResponse: (response, handler) {
                if (response.statusCode == 401 ||
                    response.statusMessage == 'Unauthorized') {
                  //handle refresh token call
                }
                return handler.next(response);
              },
              onError: (DioException e, handler) {
                return handler.next(e);
              },
            ),
          );
  final Dio _dio;

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    final token =
        await ref.read(sharedPrefProvider).read(StringConstants.$accessToken);
    try {
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postWithoutToken(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
      );
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    final token =
        await ref.read(sharedPrefProvider).read(StringConstants.$accessToken);
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } on FormatException {
      throw const FormatException('Bad response format 👎');
    } catch (e) {
      rethrow;
    }
  }
}
