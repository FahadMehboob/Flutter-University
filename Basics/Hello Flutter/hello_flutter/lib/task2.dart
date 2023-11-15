// Add a button to the screen, when pressed, it changes the text on the screen.
// Change the title in the AppBar to 'My First Flutter App'.

import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  String text = "Welcome To Flutter University";
  void changeText() {
    setState(() {
      text = "Happy Coding !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First Flutter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: changeText,
              child: const Text("Change Text"),
            ),
          ],
        ),
      ),
    );
  }
}
