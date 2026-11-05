import 'package:flutter/material.dart';

class LostFoundScreen extends StatelessWidget {
  const LostFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lost & found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.manage_search, size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 12),
              Text('Lost something on campus?', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text('This module will let students report lost items and post items they have found.'),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Coming next'),
                    content: const Text('The lost-and-found posting form will be added in the next development phase.'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Report an item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
