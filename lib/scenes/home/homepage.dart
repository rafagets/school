// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _tabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ];

    final List<Widget> _content = [
      const Text('Home'),
      const Text('Profile'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('School'),
      ),
      body: _content.elementAt(0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: _tabs,
      ),
    );
  }
}
