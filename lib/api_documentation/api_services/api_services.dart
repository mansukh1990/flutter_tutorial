import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/api_documentation/models/request/user_request.dart';
import 'package:flutter_tutorial/api_documentation/models/response/upload_media_response.dart';
import 'package:flutter_tutorial/flutter_documentation/widgets_common/util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/request/user_update_request.dart';
import '../models/response/get_products_list.dart';
import '../models/response/user_list.dart';
import '../models/response/user_response.dart';

class ApiServices {
  Future<List<UserResponse>> getUserList() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/users"),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => UserResponse.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<ProductListResponse>> getProductList() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );

      if (response.statusCode == 200) {
        List<ProductListResponse> getProductsList =
            List<ProductListResponse>.from(
              jsonDecode(
                response.body,
              ).map((e) => ProductListResponse.fromJson(e)),
            );
        return getProductsList;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  Future<dynamic> getMultiDataWithOutModel() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<CreateUserResponse?> createUser(UserRequest userRequest) async {
    const url = "https://api.escuelajs.co/api/v1/users/";
    try {
      print("🚀 API CALL STARTED");
      print("📤 URL: $url");
      print("📤 BODY: $userRequest");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userRequest.toJson()),
      );

      print("📥 STATUS CODE: ${response.statusCode}");
      print("📥 RESPONSE BODY: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ USER CREATED SUCCESSFULLY");
        return CreateUserResponse.fromJson(jsonDecode(response.body));
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error["message"].toString());
      }
    } catch (e) {
      print("🔥 API EXCEPTION: $e");
      rethrow;
    }
  }

  Future<Resource<Map<String, dynamic>>> updateUser(
    UpdateUserRequest updateUserRequest,
    String userId,
  ) async {
    final url = "https://api.escuelajs.co/api/v1/users/$userId";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updateUserRequest.toJson()),
      );

      final responseData = jsonDecode(response.body);
      print("📥 URl: $url");
      print("📥 STATUS CODE: ${response.statusCode}");
      print("📥 RESPONSE BODY: ${response.body}");

      // ✅ SUCCESS
      if (response.statusCode == 200) {
        return Resource(
          success: true,
          message: "User updated successfully",
          data: responseData,
        );
      }

      // ❌ ERROR MESSAGE FROM API
      String errorMessage = "Something went wrong";

      if (responseData is Map && responseData["message"] != null) {
        if (responseData["message"] is List) {
          errorMessage = responseData["message"].join(", ");
        } else {
          errorMessage = responseData["message"].toString();
        }
      }

      return Resource(success: false, message: errorMessage);
    } catch (e) {
      print("🔥 API EXCEPTION: $e");
      return Resource(success: false, message: "Network error");
    }
  }

  Future<Resource<bool>?> delete(String userId) async {
    try {
      final url = "https://api.escuelajs.co/api/v1/products/$userId";
      final response = await http.delete(Uri.parse(url));
      print("📥 URl: $url");
      print("📥 STATUS CODE: ${response.statusCode}");
      print("📥 RESPONSE BODY: ${response.body}");
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Resource(
          success: true,
          message: "User Delete successfully",
          data: data,
        );
      } else {
        return Resource(success: false, message: response.body);
      }
    } catch (e) {
      print(e);
      return Resource(success: false, message: e.toString());
    }
  }

  Future<UploadMediaResponse?> uploadMedia(File file) async {
    try {
      final url = 'https://api.escuelajs.co/api/v1/files/upload';
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll({"Content-Type": "multipart/form-data"});
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: file.path.toString().split('/').last,
        ),
      );
      StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("📥 URl: $url");
      print("📥 STATUS CODE: ${response.statusCode}");
      print("📥 RESPONSE BODY: ${response.body}");

      if (response.statusCode == 201) {
        UploadMediaResponse uploadMediaResponse = UploadMediaResponse.fromJson(
          jsonDecode(response.body),
        );
        return uploadMediaResponse;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
