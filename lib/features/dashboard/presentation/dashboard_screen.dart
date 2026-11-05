import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/section_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusLoop', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => context.go('/profile'),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Hello, Student 👋', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Your campus, all in one place.', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.tertiary],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('YOUR CAMPUS AT A GLANCE', style: TextStyle(color: Colors.white70, letterSpacing: 1)),
                SizedBox(height: 12),
                Text('Stay connected.\nStay organized.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const SectionTitle('Quick access'),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.55,
            children: [
              _QuickCard(title: 'Campus events', icon: Icons.event, onTap: () => context.go('/events')),
              _QuickCard(title: 'Academic planner', icon: Icons.calendar_month, onTap: () => context.go('/planner')),
              _QuickCard(title: 'Lost & found', icon: Icons.search, onTap: () => context.go('/lost-found')),
              _QuickCard(title: 'Community', icon: Icons.groups, onTap: () => context.go('/community')),
            ],
          ),
          const SizedBox(height: 24),
          const SectionTitle('Your campus companion'),
          const SizedBox(height: 10),
          const Card(
            child: ListTile(
              leading: Icon(Icons.tips_and_updates_outlined),
              title: Text('Stay updated'),
              subtitle: Text('Check announcements and upcoming campus activities regularly.'),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({required this.title, required this.icon, required this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 9),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
