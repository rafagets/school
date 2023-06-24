import 'package:flutter/material.dart';
import 'package:shcool/pages/detalhe/detalhe_page.dart';
import 'package:shcool/pages/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      detalhe: (context) => const DetalhePage(),
    };
  }
}
