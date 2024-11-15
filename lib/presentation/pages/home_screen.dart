// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';
import 'task_screen.dart';
import 'login_screen.dart';
import 'package:intl/intl.dart'; // Untuk format waktu

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isWorking = false;
  List<Task> tasks = [];
  String userName = "";
  String checkInTime = ""; // Waktu check-in
  String checkOutTime = ""; // Waktu check-out

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadWorkStatus();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "Pengguna";
      checkInTime =
          prefs.getString('checkInTime') ?? "-"; // Ambil waktu check-in
      checkOutTime =
          prefs.getString('checkOutTime') ?? "-"; // Ambil waktu check-out
    });
  }

  void loadWorkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isWorking = prefs.getBool('isWorking') ?? false;
    });
  }

  void toggleWorkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(now); // Format date and time

    setState(() {
      if (!isWorking) {
        checkInTime = formattedDateTime; // Set check-in time with date
        prefs.setString('checkInTime', checkInTime); // Simpan waktu check-in
      } else {
        checkOutTime = formattedDateTime; // Set check-out time with date
        prefs.setString('checkOutTime', checkOutTime); // Simpan waktu check-out
      }
      isWorking = !isWorking;
      prefs.setBool('isWorking', isWorking);
    });
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userName');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void addTask(String title, String description) {
    setState(() {
      tasks.add(Task(title: title, description: description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring WFH'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, $userName!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Status Kerja: ${isWorking ? "Sedang Bekerja" : "Tidak Bekerja"}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Waktu Check-in: $checkInTime',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Waktu Check-out: $checkOutTime',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: toggleWorkStatus,
              child: Text(isWorking ? 'Selesai Kerja' : 'Mulai Kerja'),
            ),
            Divider(),
            Text('Daftar Tugas', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                    subtitle: Text(tasks[index].description),
                    trailing: Checkbox(
                      value: tasks[index].isCompleted,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].isCompleted = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskScreen(addTask: addTask)),
                );
              },
              child: Text('Tambah Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}
