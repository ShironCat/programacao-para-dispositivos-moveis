import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Task')),
      body: Form(
          child: Column(
        children: [
          TextFormField(),
          SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Save')))
        ],
      )),
    );
  }
}
