import 'package:count_app_provider/provider/screen_two_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final value = 1.0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreenTwoProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Provider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ScreenTwoProvider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: provider.value,
              onChanged: (val) {
                provider.setValue(val);
              },
            );
          }),
          Consumer<ScreenTwoProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(provider.value)),
                    child: const Center(
                      child: Text(
                        "Color 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(provider.value)),
                    child: const Center(
                        child: Text(
                      "Color 2",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
