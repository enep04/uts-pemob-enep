// main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages//login_screen.dart';

void main() {
  runApp(MonitoringWFHApp());
}

class MonitoringWFHApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring WFH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckLoginScreen(),
    );
  }
}

class CheckLoginScreen extends StatefulWidget {
  @override
  _CheckLoginScreenState createState() => _CheckLoginScreenState();
}

class _CheckLoginScreenState extends State<CheckLoginScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomeScreen() : LoginScreen();
  }
}
