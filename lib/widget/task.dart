import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({
    super.key,
    required this.title,
    required this.id,
    this.onRemove,
    required this.index,
  });

  final String title;
  final String id;
  final Function(String id)? onRemove;
  final int index;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  void _handleRemoveItem() async {
    if (await confirm(context)) {
      widget.onRemove!(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:
            widget.index % 2 == 0
                ? const Color.fromARGB(255, 178, 231, 255)
                : const Color.fromARGB(255, 180, 180, 180),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _handleRemoveItem,
          ),
        ],
      ),
    );
  }
}
