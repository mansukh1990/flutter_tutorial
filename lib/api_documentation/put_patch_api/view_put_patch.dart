import 'package:flutter/material.dart';

import '../../flutter_documentation/widgets_common/util.dart';
import '../api_services/api_services.dart';
import '../models/request/user_update_request.dart';
import '../models/response/put_response.dart';

class ViewPutPatch extends StatefulWidget {
  const ViewPutPatch({super.key});

  @override
  State<ViewPutPatch> createState() => _ViewPutPatchState();
}

class _ViewPutPatchState extends State<ViewPutPatch> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final avatarController = TextEditingController();

  bool isLoading = false;
  bool isDelete = false;

  PutApiResponse? userNewRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Put Patch & Delete Api Integration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _input(nameController, "Enter Your Name"),
              _input(emailController, "Enter Your Email"),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: submitData,
                  child: const Text("Update User"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: deleteData,
                  child:
                      isDelete
                          ? CircularProgressIndicator()
                          : const Text("Delete User"),
                ),
              ),
              const SizedBox(height: 30),
              if (userNewRequest != null)
                Column(
                  children: [
                    Text("ID: ${userNewRequest!.id}"),
                    Text("Name: ${userNewRequest!.name}"),
                    Text("Email: ${userNewRequest!.email}"),
                    Text("Role: ${userNewRequest!.role}"),
                    Text("Avatar: ${userNewRequest!.avatar}"),
                    Text("Created At: ${userNewRequest!.creationAt}"),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void submitData() async {
    print("🟡 CREATE USER CLICKED");

    if (!validateInputs(context)) return;

    setState(() {
      isLoading = true;
    });

    UpdateUserRequest userRequest = UpdateUserRequest(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
    );
    try {
      final result = await ApiServices().updateUser(userRequest, '6');

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
      if (result.success) {
        AppToast.success(result.message);
      } else {
        AppToast.error(result.message);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      AppSnackBar.error(context, "User update failed");
    }

    nameController.clear();
    emailController.clear();
  }

  Widget _input(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  bool validateInputs(BuildContext context) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final avatar = avatarController.text.trim();

    if (AppValidator.isEmpty(name)) {
      AppSnackBar.error(context, "Name should not be empty");
      return false;
    }

    if (AppValidator.isEmpty(email)) {
      AppSnackBar.error(context, "Email should not be empty");
      return false;
    }

    if (!AppValidator.isEmail(email)) {
      AppSnackBar.error(context, "Email must be a valid email");
      return false;
    }

    return true;
  }

  void deleteData() async {
    try {
      final result = await ApiServices().delete('161');
      print('DATA:$result');
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      if (result!.success) {
        AppToast.success(result.message);
      } else {
        AppToast.error(result.message);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      AppSnackBar.error(context, "User delete failed");
    }
  }
}
