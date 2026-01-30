import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/dio_helper.dart';

import '../models/product_list_response.dart';
import '../models/product_map_list_response.dart';

class ApiServicesDio {
  static final DioHelper _dioHelper = DioHelper();

  Future<ProductMapListResponse> getMapProductList() async {
    final response = await _dioHelper.get(
      url: "https://dummyjson.com/products",
    );
    return ProductMapListResponse.fromJson(response);
  }

  Future<List<ProductListDioResponse>> getProductList() async {
    final response = await _dioHelper.get(
      url: "https://api.escuelajs.co/api/v1/products",
    );

    if (response is List) {
      return response
          .map(
            (e) =>
                ProductListDioResponse.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();
    } else {
      throw Exception("Expected List but got ${response.runtimeType}");
    }
  }
}
