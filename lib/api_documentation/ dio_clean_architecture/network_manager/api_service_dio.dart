import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/models/response/product_map_list_response.dart'
    show ProductMapListResponse;
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/dio_helper.dart';

import '../models/response/product_list_response.dart';

class ApiServicesDio {
  static final DioHelper _dioHelper = DioHelper();

  Future<ProductMapListResponse> getMapProductList() async {
    final response = await _dioHelper.get(
      url: "https://dummyjson.com/products",
    );
    return ProductMapListResponse.fromJson(response);
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
}
