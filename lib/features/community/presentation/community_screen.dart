import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student community')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('Welcome to CampusLoop'), subtitle: Text('Share updates, ask questions and connect with students.'))),
          Card(child: ListTile(leading: Icon(Icons.forum_outlined), title: Text('Discussion spaces'), subtitle: Text('Subject discussions and campus conversations will appear here.'))),
        ],
      ),
    );
  }
}
