import '../utils/utils.dart';
import 'Options.dart' show Options;
import 'Paginate.dart';

class ApiResponse<T> {
  dynamic responseCode;
  String? response;
  final String? status;
  final T? data;
  final Options? options;
  final Paginate? paginate;

  ApiResponse({
    this.responseCode,
    this.response,
    this.status,
    this.data,
    this.options,
    this.paginate,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return ApiResponse<T>(
      responseCode: json['responseCode'].toString(),
      response: Utils().parseToString(json['response']),
      status: Utils().parseToString(json['status']),
      data:
          json['data'] != null && fromJsonT != null
              ? fromJsonT(json['data'])
              : null,
      options:
          json['options'] != null ? Options.fromJson(json['options']) : null,
      paginate:
          json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null,
    );
  }

  static ApiResponse<List<T>> listFromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final List<dynamic> rawList = json['data'] ?? [];

    final List<T> parsedList =
        rawList.map((item) {
          return fromJsonT(item is Map<String, dynamic> ? item : {});
        }).toList();

    String? responseCode = json['responseCode']?.toString();
    String? message =
        json['response']?.toString() ??
        json['message']?.toString() ??
        json['error']?.toString() ??
        "";

    String? status =
        json['status']?.toString() ?? json['success']?.toString() ?? "";

    return ApiResponse<List<T>>(
      responseCode: responseCode,
      response: message,
      status: status,
      data: parsedList,
      options:
          json['options'] != null ? Options.fromJson(json['options']) : null,
      paginate:
          json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) toJsonT) {
    return {
      'responseCode': responseCode,
      'response': response,
      'status': status,
      'data': data != null ? toJsonT(data) : null,
      'options': options?.toJson(),
      'paginate': paginate?.toJson(),
    };
  }
}
