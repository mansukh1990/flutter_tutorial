import 'package:dio/dio.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/utils/print_value.dart';

Dio getDio() {
  Dio dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        printValue(options.uri.toString(), tag: 'API URL');
        printValue(options.headers, tag: "HEADERS");
        printValue(options.data, tag: 'REQUEST BODY:');
        handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        printValue("STATUS CODE: ${response.statusCode}");
        printValue("STATUS MESSAGE: ${response.statusMessage}");
        printValue(response.data, tag: 'API RESPONSE:');
        handler.next(response);
      },
      onError: (DioException e, handler) {
        printValue("STATUS CODE: ${e.response?.statusCode}");
        printValue("STATUS MESSAGE: ${e.response?.statusMessage}");
        printValue(e.response?.data, tag: 'ERROR DATA:');
        handler.next(e);
      },
    ),
  );
  return dio;
}
