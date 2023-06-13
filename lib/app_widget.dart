import 'package:flutter/material.dart';
import 'package:shcool/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'School',
      home: HomePage(),
    );
  }
}
