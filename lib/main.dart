import 'package:flutter/material.dart';
import 'package:flutter_state_management_first_project/feature/home_page/view/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter State Management",
      home: HomePage(),
    );
  }
}
