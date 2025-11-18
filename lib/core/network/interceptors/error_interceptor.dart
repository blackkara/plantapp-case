import 'package:dio/dio.dart';
import 'package:plantapp_case/core/errors/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(message: 'Connection timeout. Please check your internet connection.');

      case DioExceptionType.badResponse:
        throw ServerException(
          message: err.response?.data['message'] ?? 'Server error occurred',
          statusCode: err.response?.statusCode,
        );

      case DioExceptionType.cancel:
        throw NetworkException(message: 'Request cancelled');

      case DioExceptionType.unknown:
        throw NetworkException(message: 'Network error. Please check your connection.');

      default:
        throw NetworkException(message: 'Unexpected error occurred');
    }
  }
}
