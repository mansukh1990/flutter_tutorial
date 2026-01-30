import 'dart:io';

class Utils {
  String? parseToString(dynamic value) {
    if (value == null) return "";
    return value.toString();
  }

  static void screenNavigationOffAllByNamed<T>(
    String routeName, {
    T? arguments,
  }) {
    //Get.offAllNamed(routeName, arguments: arguments);
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
