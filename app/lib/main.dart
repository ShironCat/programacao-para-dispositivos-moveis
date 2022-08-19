import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('app'),
          backgroundColor: const Color.fromARGB(255, 100, 100, 100),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 175, 175, 175),
              fontWeight: FontWeight.bold),
        ),
        body: const Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
