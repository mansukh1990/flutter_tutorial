import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/ApiResponse.dart';
import '../models/Paginate.dart';
import '../preferences/preference_utils.dart';
import '../routes/route_name.dart';
import '../utils/utils.dart';
import 'NoInternetException.dart';
import 'api_constants.dart';
import 'dio_provider.dart';

class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<T> safeCall<T>(Future<T> Function() apiCall) async {
    if (!await hasNetwork()) {
      // ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   SnackBar(
      //       content: Text(
      //           "Unable to fetch route master id, please try again later")),
      // );
    }

    return await apiCall();
  }

  // Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
  //   try {
  //     Response<T> response = await api;
  //     print(response);
  //     if (response.statusCode != HttpStatus.ok) {
  //       throw Exception("Unexpected server response");
  //     }
  //     return response;
  //   } on DioException catch (dioError) {
  //     print("Exception type is: ${dioError.error.runtimeType}");
  //
  //     Exception exception = handleDioError(dioError);
  //     String toastMessage = extractErrorMessage(exception);
  //
  //     if (exception.runtimeType.toString() == "UnauthorizedException") {
  //       Utils.screenNavigationOffAllByNamed(RoutesName.login);
  //       Fluttertoast.showToast(
  //         msg: "Only one device can be logged in using the same email.",
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //       );
  //       PreferenceUtils.clearPreference();
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: toastMessage,
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //       );
  //     }
  //
  //     throw exception;
  //   }
  // }
  //

  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? query,
    required T Function(dynamic) fromJsonT,
  }) async {
    try {
      final response = await dioClient.get(url, queryParameters: query);

      final responseData =
          response.data is String ? jsonDecode(response.data) : response.data;

      return ApiResponse.fromJson(responseData, fromJsonT);
    } catch (e) {
      debugPrint("GET error at $url: $e");
      rethrow;
    }
  }

  Future<ApiResponse<T>> post<T>(
    String url, {
    dynamic body,
    Map<String, dynamic>? params, // 👈 optional params
    required T Function(dynamic) fromJsonT,
  }) async {
    try {
      final response = await dioClient.post(
        url,
        data: body, // 👈 still supports body
        queryParameters: params, // 👈 optional params
      );

      final responseData =
          response.data is String ? jsonDecode(response.data) : response.data;

      return ApiResponse<T>.fromJson(responseData, fromJsonT);
    } catch (e) {
      debugPrint("POST error at $url: $e");
      rethrow;
    }
  }

  Future<ApiResponse<T>> patch<T>(
    String url, {
    Map<String, dynamic>? body,
    required T Function(dynamic) fromJsonT,
  }) async {
    try {
      final response = await dioClient.patch(url, data: body);
      final responseData =
          response.data is String ? jsonDecode(response.data) : response.data;
      return ApiResponse<T>.fromJson(responseData, fromJsonT);
    } catch (e) {
      debugPrint("patch error at $url: $e");
      rethrow;
    }
  }

  Future<ApiResponse<List<T>>> postList<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJsonT,
    Map<String, dynamic>? params, // 👈 optional params
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dioClient.post(
        url,
        data: jsonEncode(body),
        queryParameters: params, // 👈 optional params
      );
      final Map<String, dynamic> json = response.data;
      logNullFields(json);

      final code =
          json['responseCode'] is int
              ? json['responseCode'] as int
              : int.tryParse(json['responseCode']?.toString() ?? "0");

      final message = json['response']?.toString() ?? '';
      final status = json['status']?.toString() ?? '';
      final paginateJson = json['paginate'];
      Paginate? paginateData;

      if (paginateJson != null && paginateJson is Map<String, dynamic>) {
        paginateData = Paginate.fromJson(paginateJson);
      }

      List<T> parsedData = [];

      if (code == 200) {
        // ✅ Success case: parse `data` if present
        if (json.containsKey('data')) {
          final rawData = json['data'];
          if (rawData is List) {
            parsedData =
                rawData
                    .map((e) => fromJsonT(e as Map<String, dynamic>))
                    .toList();
          } else if (rawData is Map<String, dynamic>) {
            parsedData = [fromJsonT(rawData)];
          }
        }
      } else {
        // ❌ Error case: leave parsedData empty
        parsedData = [];
      }

      return ApiResponse<List<T>>(
        data: parsedData,
        response: message,
        responseCode: code?.toString(),
        paginate: paginateData,
        status: status,
      );
    } catch (e) {
      debugPrint("POST error at $url: $e");
      return ApiResponse<List<T>>(
        data: [],
        response: e.toString(),
        responseCode: '500',
        status: 'error',
      );
    }
  }

  Future<ApiResponse<List<T>>> getList<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJsonT,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dioClient.get(
        url,
        queryParameters: query?.isNotEmpty == true ? query : null,
      );
      final Map<String, dynamic> json = response.data;
      logNullFields(json);

      return ApiResponse.listFromJson(json, fromJsonT);
    } catch (e) {
      debugPrint("GET error at $url: $e");
      rethrow;
    }
  }

  void logNullFields(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        debugPrint("Missing or null: $key");
      }
    });
  }

  // Future<ApiResponse<T>> callApiWithErrorParser<T>(
  //     Future<ApiResponse<T>> api) async {
  //
  //   if (!await Utils.hasNetwork()) {
  //     showNoInternetDialog(Get.context!, () async {
  //       // Retry API by calling the same function again
  //       await callApiWithErrorParser(api);
  //     });
  //
  //     // Stop execution for now, don’t return anything
  //     return Completer<ApiResponse<T>>().future; // a future that never completes
  //
  //   }
  //
  //   try {
  //     // Step 2: Wait for API (it might already be running, if called before network check)
  //     ApiResponse<T> response = await api;
  //
  //     // Step 3: Handle non-200 or null data
  //     if (response.responseCode != HttpStatus.ok.toString() || response.data == null) {
  //       response.response = getApiValidationMessage(response);
  //     }
  //
  //     return response;
  //
  //   } on DioException catch (dioError) {
  //     String toastMessage = dioError.response != null
  //         ? getDioErrorMessage(dioError)
  //         : "An unexpected error occurred. Please try again.";
  //
  //     if (dioError.response?.statusCode == HttpStatus.unauthorized) {
  //       Utils.screenNavigationOffAllByNamed(RouteName.login);
  //       PreferenceUtils.clearPreference();
  //     }
  //
  //     Fluttertoast.showToast(
  //       msg: toastMessage,
  //       gravity: ToastGravity.CENTER,
  //       toastLength: Toast.LENGTH_LONG,
  //     );
  //
  //     throw dioError;
  //   }
  // }

  Future<ApiResponse<T>> callApiWithErrorParser<T>(
    Future<ApiResponse<T>> apiCall,
  ) async {
    // Step 1: check internet
    if (!await Utils.hasNetwork()) {
      throw NoInternetException();
    }

    try {
      ApiResponse<T> response = await apiCall;
      if (response.responseCode == null) {
        return ApiResponse<T>(
          response: response.response ?? "Server Error",
          responseCode: "500",
          status: "error",
        );
      }

      // ⛔ If backend sends null code → treat as server error

      final code = response.responseCode.toString();

      if (code == ApiConstants.SUCCESS_CODE) {
        // Success: do nothing, return as is
        return response;
      } else if (code == ApiConstants.ERROR_CODE) {
        // Error code: get validation messages
        response.response = getAPIValidation(response);
        return response;
      } else if (code == ApiConstants.TOKEN_EXPIRED_CODE) {
        Utils.screenNavigationOffAllByNamed(RouteName.login);
        Fluttertoast.showToast(
          msg: response.response.toString(),
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG,
        );
        PreferenceUtils.clearPreference();
        return response;
      } else {
        return response;
      }
    } on DioException catch (dioError) {
      String toastMessage =
          dioError.response != null
              ? getDioErrorMessage(dioError)
              : "An unexpected error occurred. Please try again.";

      Fluttertoast.showToast(msg: toastMessage);

      throw dioError;
    }
  }

  String getAPIValidation<T>(ApiResponse<T> response) {
    String errorMsg = "";

    if (response.responseCode == ApiConstants.ERROR_CODE) {
      // Replace \\n with actual newlines
      errorMsg = (response.response ?? "").replaceAll("\\n", "\n");

      final validations = response.options?.validation ?? [];
      for (final msg in validations) {
        errorMsg = errorMsg.isEmpty ? msg : "$errorMsg\n$msg";
      }
    }

    return errorMsg;
  }

  // Helper function to check if a string is HTML
  bool _isHtml(String data) {
    final htmlPattern = RegExp(
      r"<(“[^”]*”|'[^’]*’|[^'”>])*>",
      caseSensitive: false,
    );
    return htmlPattern.hasMatch(data);
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  String getDioErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timed out. Please try again.";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return "Please check your internet connection.";
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
