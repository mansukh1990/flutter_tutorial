import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/pretty_dio_logger.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/request_headers.dart';

import 'api_constants.dart';

class DioProvider {
  static Dio? _instance;
  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: _maxLineWidth,
    logPrint: (object) => debugPrint(object.toString()), // Safe logging
  );

  static final BaseOptions _options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
    validateStatus: (_) => true,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      //  _instance!.interceptors.add(_prettyDioLogger);
      _instance!.interceptors.add(LogInterceptor(responseBody: true));
      return _instance!;
    } else {
      _instance!.interceptors.clear();
      // _instance!.interceptors.add(_prettyDioLogger);
      _instance!.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          error: true,
        ),
      );
      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();
    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();
    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    //_instance!.interceptors.add(_prettyDioLogger);
    _instance!.interceptors.add(
      LogInterceptor(
        responseBody: true,
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  // static String _buildContentType(String version) {
  //   return "user_defined_content_type+$version";
  // }

  // DioProvider.setContentType(String version) {
  //   _instance?.options.contentType = _buildContentType(version);
  // }
  //
  // DioProvider.setContentTypeApplicationJson() {
  //   _instance?.options.contentType = "application/json";
  // }
}
