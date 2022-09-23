import 'package:flutter/material.dart';
import 'package:task_list/controller/task.controller.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: ListView.builder(
        itemCount: taskController.read().length,
        itemBuilder: (context, index) {
          final task = taskController.read()[index];
          return CheckboxListTile(
              value: task.finished, onChanged: null, title: Text(task.name!));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
