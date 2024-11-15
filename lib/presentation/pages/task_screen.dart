// screens/task_screen.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TaskScreen extends StatefulWidget {
  final Function(String, String) addTask;

  TaskScreen({required this.addTask});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? fileName; // Nama file yang dipilih

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name; // Ambil nama file yang diunggah
      });
    } else {
      // Jika tidak ada file yang dipilih
      setState(() {
        fileName = null;
      });
    }
  }

  void submitTask() {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      widget.addTask(titleController.text, descriptionController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul Tugas'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickFile,
              child: Text('Pilih File'),
            ),
            if (fileName != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'File Terpilih: $fileName',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitTask,
              child: Text('Tambahkan Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}
