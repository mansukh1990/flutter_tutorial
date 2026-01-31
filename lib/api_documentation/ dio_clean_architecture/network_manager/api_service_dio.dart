import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/dio_helper.dart';

import '../models/response/ProductMapListResponse.dart';
import '../models/response/product_list_response.dart';

class ApiServicesDio {
  static final DioHelper _dioHelper = DioHelper();

  Future<ProductMapListNewResponse> getMapProductList() async {
    final response = await _dioHelper.get(
      url: "https://dummyjson.com/products",
    );
    return ProductMapListNewResponse.fromJson(response);
  }

  Future<List<ProductListDioResponse>> getProductList() async {
    try {
      final response = await _dioHelper.get(
        url: "https://api.escuelajs.co/api/v1/products",
      );
      if (response is List) {
        return response.map((e) => ProductListDioResponse.fromJson(e)).toList();
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      throw Exception("Product API Error: $e");
    }
  }

  //without model
  Future<dynamic> getMapProductWithoutModelList() async {
    Map<String, dynamic> response = await _dioHelper.get(
      url: "https://dummyjson.com/products",
    );
    return response;
  }

  //without model
  Future<dynamic> getProductWithoutModelList() async {
    try {
      List<dynamic> response = await _dioHelper.get(
        url: "https://api.escuelajs.co/api/v1/products",
      );
      return response;
    } catch (e) {
      throw Exception("Product API Error: $e");
    }
  }
}
