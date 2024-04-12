// ignore_for_file: avoid_dynamic_calls

import 'dart:io';
import 'package:dio/dio.dart';

///This class can be cleaned up and implemented better
class NetworkExceptions {
  static String getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          return switch (error.type) {
            DioExceptionType.unknown => 'Something went wrong here!!',
            DioExceptionType.badCertificate => '',
            DioExceptionType.badResponse =>
              _parseErrorResponseMessage(error.response),
            DioExceptionType.cancel => 'Operation cancelled',
            DioExceptionType.connectionTimeout => 'Request timed out',
            DioExceptionType.sendTimeout => 'Request timed out',
            DioExceptionType.receiveTimeout => 'Request timed out',
            DioExceptionType.connectionError => 'Connetion Error',
          };
        } else if (error is SocketException) {
          return 'No internet connection!';
        } else {
          return 'Unexpected error occured';
        }
      } on FormatException {
        return 'Bad response format';
      } catch (_) {
        return 'Unexpected error occured';
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return 'Unexpected error occured';
      } else {
        return 'Unexpected error occured';
      }
    }
  }

  static String _parseErrorResponseMessage(Response<dynamic>? response) {
    return switch (response!.data['data']['message'] == null) {
      true => 'An error occured here',
      false => response.data['data']['message'],
    };
  }
}
