//  Create a Container widget with custom dimensions, padding, and a border.

import 'package:flutter/material.dart';

class Task4 extends StatelessWidget {
  const Task4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container Widget"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 250,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          child: const Center(child: Text("Custom Button with Container")),
        ),
      ),
    );
  }
}
