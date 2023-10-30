import 'package:flutter/material.dart';
import 'package:notes/views/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.amber[600],
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}