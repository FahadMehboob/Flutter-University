import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TaskInput(
            taskIcon: Icon(
              Icons.task_alt,
              color: Theme.of(context).primaryColor,
            ),
            taskController: taskTitle,
            hintText: "Enter Task Title",
          ),
          TaskInput(
            taskIcon: Icon(
              Icons.task,
              color: Theme.of(context).primaryColor,
            ),
            taskController: taskDetail,
            hintText: "Enter Task Detail",
          ),
          const SizedBox(
            height: 40,
          ),
          FilledButton(
            style: FilledButton.styleFrom(fixedSize: const Size(300, 55)),
            onPressed: () {
              Navigator.pop(context,
                  Task(title: taskTitle.text, detail: taskDetail.text));
            },
            child: const Text("Add Task"),
          )
        ],
      ),
    );
  }
}

class TaskInput extends StatelessWidget {
  final TextEditingController taskController;
  final String hintText;
  final Icon taskIcon;
  const TaskInput({
    Key? key,
    required this.taskController,
    required this.hintText,
    required this.taskIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: const TextStyle(
          height: 1.4,
          fontSize: 18,
        ),
        controller: taskController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          prefixIcon: taskIcon,
        ),
      ),
    );
  }
}

class Task {
  final String title, detail;
  Task({required this.title, required this.detail});
}
