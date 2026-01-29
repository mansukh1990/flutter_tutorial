import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/dio_helper.dart';

import '../models/get_object_product_response.dart';

class ApiServices {
  static final DioHelper _dioHelper = DioHelper();

  Future<GetObjectProductResponse> getMapProductList() async {
    Map<String, dynamic> response = await _dioHelper.get(
      url: 'https://dummyjson.com/products',
    );
    return GetObjectProductResponse.fromJson(response);
  }
}
