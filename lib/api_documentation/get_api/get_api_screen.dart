import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../models/user_response.dart';

class ViewGetApiScreen extends StatefulWidget {
  const ViewGetApiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ViewGetApiScreenState();
}

class _ViewGetApiScreenState extends State<ViewGetApiScreen> {
  List<UserResponse> userList = [];
  bool isLoading = false;

  void getUserList() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await ApiServices().getUserList();
      setState(() {
        userList = response;
      });
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

  @override
  void initState() {
    getUserList();
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
      body: Visibility(
        visible: isLoading == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userList[index].name!),
              subtitle: Text(userList[index].role!),
            );
          },
        ),
      ),
    );
  }
}
