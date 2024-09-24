import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    super.key,
    required this.addTask,
  });

  void _handleAddTask(BuildContext context) {
    String name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);

    Navigator.pop(context);
  }

  TextEditingController controller = TextEditingController();

  final Function addTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Add your task",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handleAddTask(context),
                child: const Text("Add task"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
