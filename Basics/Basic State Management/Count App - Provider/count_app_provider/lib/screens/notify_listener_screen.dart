import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stateless As Statefull",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                  decoration: InputDecoration(
                    hintText: "🔐 Password",
                    hintStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                    ),
                    suffix: InkWell(
                      onTap: () => toggle.value = !toggle.value,
                      child: Icon(
                        toggle.value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                        size: 30.0,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Card(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Count: ${_counter.value}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.add, size: 30.0),
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
      ),
    );
  }
}
