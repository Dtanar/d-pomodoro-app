import 'package:dtanar_pomodor/pages/pomodoro_page.dart';
import 'package:dtanar_pomodor/provider/time_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TimerServices>(
    create: (_) => TimerServices(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroPage(),
    );
  }
}
