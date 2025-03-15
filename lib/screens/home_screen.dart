import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_detail_screen.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Belajar Flutter',
      description: 'Mempelajari dasar-dasar Flutter dan widget',
      deadline: DateTime.now().add(Duration(days: 2)),
    ),
    Task(
      id: '2',
      title: 'Mengerjakan Proyek',
      description: 'Menyelesaikan proyek aplikasi mobile',
      deadline: DateTime.now().add(Duration(days: 5)),
    ),
  ];

  void _addNewTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void _toggleTaskCompletion(String taskId) {
    setState(() {
      final task = tasks.firstWhere((task) => task.id == taskId);
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text('Tidak ada tugas. Tambahkan tugas baru!'),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => _toggleTaskCompletion(task.id),
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    '${task.deadline.day}/${task.deadline.month}/${task.deadline.year}',
                  ),
                  onTap: () {
                    // Navigator.push
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => TaskDetailScreen(
                          task: task,
                          onToggleCompletion: _toggleTaskCompletion,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // Navigator.push dan mendapatkan hasil
          final newTask = await Navigator.of(context).push<Task>(
            MaterialPageRoute(
              builder: (ctx) => AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            _addNewTask(newTask);
          }
        },
      ),
    );
  }
}
