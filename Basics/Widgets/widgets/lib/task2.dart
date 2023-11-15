// Create a stateful widget with a button that, when pressed, toggles between two images.

import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  bool imageBool = false;
  String imageLink1 =
      "https://media.istockphoto.com/id/1297349747/photo/hot-air-balloons-flying-over-the-botan-canyon-in-turkey.jpg?s=612x612&w=0&k=20&c=kt8-RRzCDunpxgKFMBBjZ6jSteetNhhSxHZFvHQ0hNU=";
  String imageLink2 =
      "https://media.istockphoto.com/id/1441926420/photo/hot-air-balloons-at-love-valley-in-cappadocia.webp?b=1&s=170667a&w=0&k=20&c=-aUXsEnEgFOE400S6hT7K6SU_4Mq6239pbo3v7KbOSU=";
  void changeImage() {
    setState(() {
      imageBool = !imageBool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageBool ? imageLink1 : imageLink2),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                changeImage();
              },
              icon: const Icon(Icons.shuffle),
              label: const Text("Change Image"),
            )
          ],
        ),
      ),
    );
  }
}
