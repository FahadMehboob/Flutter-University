// Create a stateless widget that displays an image from the internet.

import 'package:flutter/material.dart';
import 'package:widgets/task2.dart';
import 'package:widgets/task3.dart';
import 'package:widgets/task4.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Task4(),
    );
  }
}

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://thumbs.dreamstime.com/b/colorful-fall-scenery-reflection-lake-landscape-sunset-colorful-fall-scenery-bright-golden-colors-trees-reflected-104998367.jpg"),
      ),
    );
  }
}
