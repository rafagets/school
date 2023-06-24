import 'package:flutter/material.dart';
import 'package:shcool/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School',
      routes: AppRoutes.routes(),
    );
  }
}
