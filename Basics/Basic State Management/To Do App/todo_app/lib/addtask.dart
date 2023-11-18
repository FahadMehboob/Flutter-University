import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class AddTask extends StatefulWidget {
  final Task? initialTask;

  const AddTask({Key? key, this.initialTask}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController taskTitle;
  late TextEditingController taskDetail;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with initial task information if provided
    taskTitle = TextEditingController(text: widget.initialTask?.title ?? '');
    taskDetail = TextEditingController(text: widget.initialTask?.detail ?? '');
  }

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
            onPressed: () {
              Navigator.pop(
                context,
                Task(title: taskTitle.text, detail: taskDetail.text),
              );
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
              color: Theme.of(context).primaryColorDark,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          prefixIcon: taskIcon,
        ),
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(300, 55),
      ),
      child: child,
    );
  }
}
