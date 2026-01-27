import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/models/response/get_products_list.dart';

import '../api_services/api_services.dart';
import '../models/response/user_response.dart';

class ViewGetApiScreen extends StatefulWidget {
  const ViewGetApiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ViewGetApiScreenState();
}

class _ViewGetApiScreenState extends State<ViewGetApiScreen> {
  List<UserResponse> userList = [];
  List<ProductListResponse> productList = [];
  bool isLoading = false;

  void getUserList() async {
    setState(() {
      isLoading = true;
    });
    try {
      userList = await ApiServices().getUserList();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void getProductList() async {
    setState(() {
      isLoading = true;
    });
    try {
      var productList = (await ApiServices().getProductList());
      setState(() {
        isLoading = false;
        this.productList = productList;
      });
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    //getUserList();
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Get Api Integration"),
        centerTitle: true,
      ),
      /* body: Visibility(
        visible: isLoading == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userList[index].name!.toString()),
              subtitle: Text(userList[index].role!),
            );
          },
        ),
      ),*/
      body: Visibility(
        visible: isLoading == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(productList[index].price!.toString()),
              subtitle: Text(productList[index].title!),
            );
          },
        ),
      ),
    );
  }
}
