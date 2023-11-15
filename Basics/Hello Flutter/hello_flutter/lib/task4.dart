import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  const Task3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image From Internet"),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(
            "https://t4.ftcdn.net/jpg/05/50/61/75/360_F_550617518_Eu3U6kTl3mODPvnfTMFHQ88z1y5KNfNQ.jpg"),
      ),
    );
  }
}
