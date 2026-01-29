import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/api_service.dart';

import '../models/get_object_product_response.dart';

class DioHomeScreen extends StatefulWidget {
  const DioHomeScreen({super.key});

  @override
  State<DioHomeScreen> createState() => _DioHomeScreenState();
}

class _DioHomeScreenState extends State<DioHomeScreen> {
  GetObjectProductResponse response = GetObjectProductResponse();

  getData() {
    ApiServices()
        .getMapProductList()
        .then((value) {
          setState(() {
            response = value;
          });
        })
        .onError((error, stackTrace) {
          print(error.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(title: Text("Title"), subtitle: Text("SubTitle"));
        },
      ),
    );
  }
}
