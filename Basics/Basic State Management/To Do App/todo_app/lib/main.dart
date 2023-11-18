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
        ),
      ),
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
        },
      ),
      body: Material(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: const ListTile(
                  leading: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  tasks.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      tasks[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      tasks[index].detail,
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        // Navigate to AddTask with the task for editing
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTask(
                              initialTask: tasks[index],
                            ),
                          ),
                        );

                        // Check if editing was successful and update the task
                        if (result != null) {
                          setState(() {
                            tasks[index] = result;
                          });
                        }
                      },
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Task {
  final String title, detail;
  Task({required this.title, required this.detail});
}
