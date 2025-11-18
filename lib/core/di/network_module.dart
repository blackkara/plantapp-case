import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp_case/core/network/api_constants.dart';
import 'package:plantapp_case/core/network/interceptors/error_interceptor.dart';
import 'package:plantapp_case/core/network/interceptors/logging_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    dio.interceptors.addAll([LoggingInterceptor(), ErrorInterceptor()]);

    return dio;
  }
}
