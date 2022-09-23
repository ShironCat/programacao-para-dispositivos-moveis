import 'package:task_list/model/task.model.dart';

class TaskController {
  final tasks = [
    Task('Estudar para prova'),
    Task('Passear com o cachorro', finished: true),
    Task('Fazer a rematricula na disciplina')
  ];

  void create(Task task) {
    tasks.add(task);
  }

  List<Task> read() {
    return tasks;
  }

  void update(Task task) {}

  void delete(Task task) {}
}
