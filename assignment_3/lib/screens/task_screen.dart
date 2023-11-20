import 'package:assignment_3/provider/tasklist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(labelText: 'Enter Task'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          Provider.of<TaskList>(context, listen: false).addTask(_controller.text);
                          _controller.clear();
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Consumer<TaskList>(
              builder: (context, taskList, child) {
                if (taskList.tasks.isEmpty) {
                  return const Center(
                    child: Text(
                      'No tasks available yet.',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: taskList.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskList.tasks[index];
                      return Card(
                        elevation: 3,
                        color: task.isCompleted ? Colors.green.withOpacity(0.3) : null,
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                task.description,
                                style: TextStyle(
                                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                  color: task.isCompleted ? Colors.green : null,
                                ),
                              ),
                              if (task.isCompleted)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                            ],
                          ),
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (value) {
                              Provider.of<TaskList>(context, listen: false).toggleTaskCompletion(index);
                            },
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!task.isCompleted) // Only show Edit/Delete if the task is not completed
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    _controller.text = task.description;
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Edit Task'),
                                          content: TextField(
                                            controller: _controller,
                                            decoration: const InputDecoration(labelText: 'New Task Description'),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                final newDescription = _controller.text;
                                                if (newDescription.isNotEmpty) {
                                                  taskList.editTask(index, newDescription);
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: const Text('Save'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              if (!task.isCompleted) // Only show Edit/Delete if the task is not completed
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 186, 70, 61),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Confirm Deletion'),
                                          content: const Text('Are you sure you want to delete this task?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                taskList.removeTask(index);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
