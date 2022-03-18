import 'package:flutter/material.dart';
import 'package:flutter_docker/ui/ui.dart';

void main() {
  runApp(const MyDoctorApp());
}

class MyDoctorApp extends StatelessWidget {
  const MyDoctorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      title: "Home",
      home: HomePage(),
    );
  }
}

