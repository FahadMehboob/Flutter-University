// Create a simple to-do list app where you can add and remove items.

import 'package:flutter/material.dart';
import 'package:todo_app/addtask.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.grey[700],
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.black,
          )),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO-DO APP"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTask(),
              ),
            );
            if (result != null) {
              setState(() {
                tasks.add(result);
              });
            }
          }),
      body: Material(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Draggable(
              feedback: ListTile(
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].detail),
              ),
              childWhenDragging: Container(
                child: const ListTile(
                  title: Text('Delete Task'),
                  leading: Icon(Icons.delete),
                ),
              ),
              onDragEnd: (details) {
                if (details.wasAccepted) {
                  setState(() {
                    tasks = List.from(tasks)..removeAt(index);
                  });
                }
              },
              child: ListTile(
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].detail),
              ),
            );
          },
        ),
      ),
    );
  }
}
