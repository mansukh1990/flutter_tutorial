import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/utils/smart_management.dart';

import 'log.dart';

abstract class GetInterface {
  SmartManagement smartManagement = SmartManagement.full;
  RouterDelegate? routerDelegate;
  RouteInformationParser? routeInformationParser;
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}
