import 'package:flutter/material.dart';
import 'package:task_list/view/android/create.page.dart';
import 'package:task_list/view/android/list.page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
      routes: {
        '/list': (context) => ListPage(),
        '/create': (context) => const CreatePage()
      },
    );
  }
}
