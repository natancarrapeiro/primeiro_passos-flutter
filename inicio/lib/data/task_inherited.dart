// atalho inh
import 'package:flutter/material.dart';
import 'package:inicio/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);
  // cria uma lista onde vai fica armazenado as tarefas

  final List <Task>taskList = [
    Task("flutter", "assets/images/flutter.png", 3),
    Task("python", "assets/images/python.jpg", 1),
    Task("kotlin", "assets/images/kotlin.png", 3),
    Task("java", "assets/images/java.png", 4),
    Task("Android", "assets/images/android.png", 5),
  ];
  // função para add novo item a list
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No  found in context');
    return
    result
    !;
  }

  @override
  // observa o estado
  bool updateShouldNotify(TaskInherited  oldWidget) {
    // tamanho da lista anterior é != de agora = bool
    return oldWidget.taskList.length != taskList.length;
  }
}
