import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 38, child: Icon(Icons.person, size: 42)),
          const SizedBox(height: 12),
          Text('Student Name', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          const Text('student@example.com', textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Card(
            child: SwitchListTile(
              title: const Text('Dark mode'),
              secondary: const Icon(Icons.dark_mode_outlined),
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
                widget.onThemeChanged(value);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(CupertinoIcons.info),
              title: const Text('About CampusLoop'),
              subtitle: const Text('Smart Campus Companion'),
            ),
          ),
        ],
      ),
    );
  }
}
