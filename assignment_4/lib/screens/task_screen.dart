// tasks_screen.dart
import 'package:assignment_4/helper/database_helper.dart';
import 'package:assignment_4/model/task_model.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _taskController = TextEditingController();
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = [];
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    _tasks = await DatabaseHelper.instance.getAllTasks();
    setState(() {});
  }

  Future<void> _addTask() async {
    if (_taskController.text.isNotEmpty) {
      Task newTask = Task(title: _taskController.text, isCompleted: false);
      await DatabaseHelper.instance.insertTask(newTask);
      _loadTasks();
      _taskController.clear();
    }
  }

  Future<void> _updateTask(Task task) async {
    task.isCompleted = !task.isCompleted;
    await DatabaseHelper.instance.updateTask(task);
    _loadTasks();
  }

  Future<void> _deleteTask(Task task) async {
    if (task.id != null) {
      await DatabaseHelper.instance.deleteTask(task.id!); // Use the non-null assertion operator (!)
      _loadTasks();
    }
  }

  Future<void> _editTask(Task task) async {
    TextEditingController editController = TextEditingController();
    editController.text = task.title;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: editController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                task.title = editController.text;
                await DatabaseHelper.instance.updateTask(task);
                _loadTasks();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 92, 125, 151),
        title: const Text('Task Management'),
      ),
      body: Container(
        color: Colors.white, // Set the default background color to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color.fromARGB(255, 92, 125, 151), // Set the background color for this section to blue
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                  ),
                  elevation: 10, // Add elevation for a card-like appearance
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Enter a new task',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _taskController,
                                decoration: const InputDecoration(
                                  hintText: 'Type here...',
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                _addTask();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  bool isEven = index % 2 == 0;
                  Task task = _tasks[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isEven ? Colors.grey[200] : Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) {
                            _updateTask(task);
                          },
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 18,
                              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editTask(task);
                          },
                        ),
                        IconButton(
                          tooltip: 'Edit',
                          color: Colors.red,
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteTask(task);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
