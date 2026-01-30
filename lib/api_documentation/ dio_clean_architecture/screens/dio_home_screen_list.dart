import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/api_service_dio.dart';

import '../models/product_list_response.dart';

class DioHomeScreenList extends StatefulWidget {
  const DioHomeScreenList({super.key});

  @override
  State<DioHomeScreenList> createState() => _DioHomeScreenListState();
}

class _DioHomeScreenListState extends State<DioHomeScreenList> {
  List<ProductListDioResponse> response = [];
  bool isLoading = true;

  getData() async {
    try {
      final value = await ApiServicesDio().getProductList();
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
        title: Text("Get Api List"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.blue))
              : ListView.builder(
                itemCount: response.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        response[index].id.toString(),
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    title: Text(response[index].title ?? ""),
                    subtitle: Text(response[index].description ?? ""),
                  );
                },
              ),
    );
  }
}
