import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final Function(String) onToggleCompletion;

  TaskDetailScreen({
    required this.task,
    required this.onToggleCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                Checkbox(
                  value: task.isCompleted,
                  onChanged: (_) => onToggleCompletion(task.id),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              task.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Tenggat Waktu:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${task.deadline.day}/${task.deadline.month}/${task.deadline.year}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                child: Text('Kembali ke Beranda'),
                onPressed: () {
                  // Navigator.pop
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
