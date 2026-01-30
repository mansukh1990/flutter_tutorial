import 'package:flutter/material.dart';

import '../models/product_map_list_response.dart';
import '../network_manager/api_service_dio.dart';

class DioHomeScreen extends StatefulWidget {
  const DioHomeScreen({super.key});

  @override
  State<DioHomeScreen> createState() => _DioHomeScreenState();
}

class _DioHomeScreenState extends State<DioHomeScreen> {
  ProductMapListResponse response = ProductMapListResponse();
  bool isLoading = true;

  getData() async {
    try {
      final value = await ApiServicesDio().getMapProductList();
      setState(() {
        response = value;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("API Error => $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api Map"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.blue))
              : ListView.builder(
                itemCount: response.products?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        response.products![index].thumbnail! ?? "",
                      ),
                    ),
                    title: Text(response.products?[index].id.toString() ?? ""),
                    subtitle: Text(response.products?[index].title ?? ""),
                  );
                },
              ),
    );
  }
}
