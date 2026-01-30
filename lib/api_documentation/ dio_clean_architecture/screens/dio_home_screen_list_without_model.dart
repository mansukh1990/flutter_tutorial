import 'package:flutter/material.dart';

import '../network_manager/api_service_dio.dart';

class DioHomeScreenListWithoutModel extends StatefulWidget {
  const DioHomeScreenListWithoutModel({super.key});

  @override
  State<DioHomeScreenListWithoutModel> createState() =>
      _DioHomeScreenListWithoutModelState();
}

class _DioHomeScreenListWithoutModelState
    extends State<DioHomeScreenListWithoutModel> {
  bool isLoading = true;
  List<dynamic> response = [];

  getData() async {
    final value = await ApiServicesDio().getProductWithoutModelList();

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
        title: Text("Get Api without model list"),
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
                      child: Text(response[index]['id'].toString()),
                    ),
                    title: Text(response[index]['title']),
                    subtitle: Text(response[index]['description'] ?? ""),
                  );
                },
              ),
    );
  }
}
