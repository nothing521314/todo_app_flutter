import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/items.dart';
import 'package:todo_app_flutter/widget/new_task_modal.dart';
import 'package:todo_app_flutter/widget/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ToDoList'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DataItem> _items = [];

  void _handleAddItem(String title) {
    setState(() {
      _items.add(DataItem(title: title, id: DateTime.now().toString()));
    });
  }

  void _removeItem(String id) {
    setState(() {
      _items.removeWhere((e) => e.id == id);
    });
  }

  void _handleOpenModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder:
          (BuildContext context) =>
              NewTaskModalBottomSheet(addTask: _handleAddItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.black38,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
              _items
                  .map(
                    (item) => Task(
                      title: item.title,
                      id: item.id,
                      onRemove: _removeItem,
                      index: _items.indexOf(item),
                    ),
                  )
                  .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOpenModalBottomSheet,
        tooltip: 'Add Task',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
