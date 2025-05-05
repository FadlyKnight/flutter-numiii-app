import 'package:flutter/material.dart';
import 'layouts/base.dart'; // import halaman login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BaseLayout(), // Root-nya langsung ke layout
    );
  }
}
