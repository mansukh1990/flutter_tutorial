import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/network_manager/api_service_dio.dart';

class DioHomeScreenMapListWithoutModel extends StatefulWidget {
  const DioHomeScreenMapListWithoutModel({super.key});

  @override
  State<DioHomeScreenMapListWithoutModel> createState() =>
      _DioHomeScreenMapListWithoutModelState();
}

class _DioHomeScreenMapListWithoutModelState
    extends State<DioHomeScreenMapListWithoutModel> {
  bool isLoading = true;
  Map<String, dynamic> response = {};

  getData() async {
    final value = await ApiServicesDio().getMapProductWithoutModelList();
    setState(() {
      response = value;
      isLoading = false;
    });
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
        title: Text("Get Api without model Map"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.blue))
              : ListView.builder(
                itemCount: response['products'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        response['products'][index]['thumbnail']! ?? "",
                      ),
                    ),
                    title: Text(
                      response['products'][index]['id'].toString() ?? "",
                    ),
                    subtitle: Text(response['products'][index]['title'] ?? ""),
                  );
                },
              ),
    );
  }
}
