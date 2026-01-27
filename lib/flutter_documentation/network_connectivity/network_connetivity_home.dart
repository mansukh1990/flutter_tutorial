import 'package:flutter/material.dart';
import 'package:flutter_tutorial/flutter_documentation/widgets_common/util.dart';

import 'network_connectivity.dart';

class NetworkConnectivityPage extends StatelessWidget {
  const NetworkConnectivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "Network connectivity",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (await NetworkUtil.isNetworkAvailable()) {
              AppToast.toast("Network is available");
              print("Network is available");
            } else {
              print("Network is not available");
              AppToast.toast("Network is not available");
            }
          },
          child: Text("Check Net"),
        ),
      ),
    );
  }
}
