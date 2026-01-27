import 'package:flutter/material.dart';
import 'package:flutter_tutorial/flutter_documentation/widgets_common/util.dart';

void main() {
  runApp(ToastMessageApp());
}

class ToastMessageApp extends StatelessWidget {
  const ToastMessageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Toast Message"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              AppToast.toast("Flutter toast");
            },
            child: Text("Show Toast"),
          ),
        ),
      ),
    );
  }
}
