import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now().add(Duration(days: 1));

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitForm() {
    if (_titleController.text.isEmpty) {
      return;
    }

    final newTask = Task(
      id: DateTime.now().toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      deadline: _selectedDate,
    );

    // Navigator.pop dengan data
    Navigator.of(context).pop(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tenggat Waktu: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Tambah Tugas'),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // Navigator.pop tanpa data
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}
