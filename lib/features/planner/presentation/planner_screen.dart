import 'package:flutter/material.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final List<String> _tasks = ['Complete Flutter assignment', 'Prepare for project review'];

  void _addTask() {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add a task'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter task name'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) setState(() => _tasks.add(value));
              Navigator.pop(dialogContext);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Academic planner')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('My tasks', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ..._tasks.map((task) => Card(
                child: ListTile(
                  leading: const Icon(Icons.task_alt),
                  title: Text(task),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => setState(() => _tasks.remove(task)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
