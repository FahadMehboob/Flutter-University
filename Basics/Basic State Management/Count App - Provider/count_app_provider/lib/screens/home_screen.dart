import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:count_app_provider/provider/homescreen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeScreenProvider =
        Provider.of<HomeScreenPorvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      homeScreenProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("All widget is not buildning");
    final homeScreenProvider =
        Provider.of<HomeScreenPorvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count App Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<HomeScreenPorvider>(
              builder: (context, value, child) {
                print("Only this widget is build");
                return Text(
                  value.count.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeScreenProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
