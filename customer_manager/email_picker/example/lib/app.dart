import 'package:example/page/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'appTitle',
            key: ValueKey('appbar'),
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}
