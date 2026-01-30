import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/%20dio_clean_architecture/screens/dio_home_screen_list.dart';

void main() {
  runApp(Diomain());
}

class Diomain extends StatefulWidget {
  const Diomain({super.key});

  @override
  State<Diomain> createState() => _DiomainState();
}

class _DiomainState extends State<Diomain> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Api Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DioHomeScreenList(),
      //DioHomeScreen(),
    );
  }
}
