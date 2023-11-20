import 'package:assignment_3/model/task_model.dart';
import 'package:flutter/material.dart';

class TaskList with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String description) {
    _tasks.add(Task(description, false));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, String newDescription) {
    _tasks[index].description = newDescription;
    notifyListeners();
  }
}
