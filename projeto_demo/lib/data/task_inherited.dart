import 'package:flutter/material.dart';
import 'package:projeto_demo_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
     Task(
      'Aprender Flutter',
      'assets/images/dash.png',
      3),
     Task(
        'Andar de bike',
        'assets/images/bike.webp',
        2),
     Task(
        'Meditar',
        'assets/images/meditar.jpeg',
        5),
     Task(
        'Correr',
        'assets/images/correr.jpg',
        5),];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
