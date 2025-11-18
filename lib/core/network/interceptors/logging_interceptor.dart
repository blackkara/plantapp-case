import 'package:dio/dio.dart';
import 'package:plantapp_case/core/services/logger_service.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerService.info('REQUEST[${options.method}] => PATH: ${options.path}', tag: 'HTTP');
    LoggerService.debug('Headers: ${options.headers}', tag: 'HTTP');
    LoggerService.debug('Data: ${options.data}', tag: 'HTTP');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerService.info('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}', tag: 'HTTP');
    LoggerService.debug('Data: ${response.data}', tag: 'HTTP');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerService.error(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      tag: 'HTTP',
      error: err,
    );
    super.onError(err, handler);
  }
}
