import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/api_services/api_services.dart';
import 'package:flutter_tutorial/flutter_documentation/widgets_common/util.dart';

import '../models/request/user_request.dart';
import '../models/response/user_list.dart';

enum UiState { empty, loading, success, error }

class ViewPostApi extends StatefulWidget {
  const ViewPostApi({super.key});

  @override
  State<ViewPostApi> createState() => _ViewPostApiState();
}

class _ViewPostApiState extends State<ViewPostApi> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final avatarController = TextEditingController();

  UiState uiState = UiState.empty;
  bool isLoading = false;
  String errorMessage = "";

  CreateUserResponse? userNewRequest;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Post Api Integration"),
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
              _input(passwordController, "Enter Your Password"),
              _input(avatarController, "Enter Your Avatar"),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : submitData,
                  child: const Text("Create User"),
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

    UserRequest userRequest = UserRequest(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      avatar: avatarController.text,
    );
    try {
      userNewRequest = await ApiServices().createUser(userRequest);

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
      AppSnackBar.success(context, "User created successfully");
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      AppSnackBar.error(context, "User creation failed");
    }

    if (!mounted) return;

    nameController.clear();
    emailController.clear();
    passwordController.clear();
    avatarController.clear();
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

    if (AppValidator.isEmpty(password)) {
      AppSnackBar.error(context, "Password should not be empty");
      return false;
    }

    if (password.length < 4) {
      AppSnackBar.error(
        context,
        "Password must be longer than or equal to 4 characters",
      );
      return false;
    }

    if (!AppValidator.isPasswordValid(password)) {
      AppSnackBar.error(
        context,
        "Password must contain only letters and numbers",
      );
      return false;
    }

    if (AppValidator.isEmpty(avatar)) {
      AppSnackBar.error(context, "Avatar should not be empty");
      return false;
    }

    if (!AppValidator.isUrl(avatar)) {
      AppSnackBar.error(context, "Avatar must be a valid URL address");
      return false;
    }

    return true;
  }
}
