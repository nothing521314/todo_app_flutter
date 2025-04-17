import 'package:flutter/material.dart';

class NewTaskModalBottomSheet extends StatelessWidget {
  NewTaskModalBottomSheet({super.key, required this.addTask});

  final Function addTask;

  final TextEditingController _taskTitleController = TextEditingController();

  void _addTask(BuildContext context) {
    final title = _taskTitleController.text;
    if (title.isEmpty) return;
    addTask(title);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust size to content
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
              controller: _taskTitleController,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _addTask(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
