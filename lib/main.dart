

import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users List',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: const HomePage(), // Ensure HomePage is properly imported and accessible
    );
  }
}
