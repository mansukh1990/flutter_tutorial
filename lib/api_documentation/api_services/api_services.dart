import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/user_response.dart';

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
}
