import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void printValue(dynamic value, {String tag = ""}) {
  try {
    if (value is Map || value is List) {
      log("$tag\n${JsonEncoder.withIndent('  ').convert(value)}\n");
      return;
    }

    final decoded = json.decode(value.toString());
    log("$tag\n${JsonEncoder.withIndent('  ').convert(decoded)}\n");
  } catch (_) {
    if (kDebugMode) {
      print("$tag $value\n");
    }
  }
}
