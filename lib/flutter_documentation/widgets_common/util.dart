import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarColors {
  static const success = Colors.green;
  static const error = Colors.red;
  static const warning = Colors.orange;
  static const info = Colors.blue;
}

class AppSnackBar {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color backgroundColor = SnackBarColors.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static void success(BuildContext context, String message) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: SnackBarColors.success,
    );
  }

  static void error(BuildContext context, String message) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: SnackBarColors.error,
    );
  }

  static void warning(BuildContext context, String message) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: SnackBarColors.warning,
    );
  }
}

class AppColors {
  static const success = Colors.green;
  static const error = Colors.red;
  static const warning = Colors.orange;
  static const info = Colors.blue;
}

class AppToast {
  static void toast(String message, {Color bgColor = Colors.black}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      fontSize: 16.0,
      textColor: Colors.white,
    );
  }

  static void success(String message) {
    toast(message, bgColor: Colors.green);
  }

  static void error(String message) {
    toast(message, bgColor: Colors.red);
  }

  static void warning(String message) {
    toast(message, bgColor: Colors.orange);
  }
}

class Logger {
  static void log(String message) {
    print("$message");
  }

  static void error(String message) {
    print("$message");
  }

  static void api(String message) {
    print("$message");
  }
}

class AppValidator {
  static bool isEmpty(String value) => value.trim().isEmpty;

  static bool isEmail(String value) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  static bool isPasswordValid(String value) {
    return RegExp(r'^[a-zA-Z0-9]{4,}$').hasMatch(value);
  }

  static bool isUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }
}

class Resource<T> {
  final bool success;
  final String message;
  final T? data;

  Resource({required this.success, required this.message, this.data});
}
