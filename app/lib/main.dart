import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var count = 0;

  incrementCount() {
    setState(() {
      count++;
    });
  }

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello, World!',
              style: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
            ),
            Text(
              '$count',
              style: const TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
            )
          ],
        )),
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementCount,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
