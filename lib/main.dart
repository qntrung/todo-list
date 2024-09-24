import 'package:first_flutter/model/item.dart';
import 'package:first_flutter/widget/card_modal_bottom.dart';
import 'package:first_flutter/widget/card_body_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Item> items = [];

  void _handleAddTask(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "ToDoList",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: items
              .asMap()
              .entries
              .map((entry) => CardBody(
                    item: entry.value,
                    handleDelete: _handleDeleteTask,
                    index: entry.key,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.grey.shade300,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return ModalBottom(addTask: _handleAddTask);
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
