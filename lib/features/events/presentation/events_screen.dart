import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/events_cubit.dart';
import '../cubit/events_state.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus events')),
      body: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          if (state.status == EventsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == EventsStatus.failure) {
            return Center(child: Text(state.message));
          }
          if (state.events.isEmpty) {
            return const Center(child: Text('No events available.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.events.length,
            itemBuilder: (context, index) {
              final event = state.events[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.event, size: 20),
                          const SizedBox(width: 8),
                          Expanded(child: Text(event.date, style: Theme.of(context).textTheme.labelLarge)),
                        ],
                        ),
                      const SizedBox(height: 10),
                      Text(event.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(event.description),
                      const SizedBox(height: 6),
                      Text('Venue: ${event.venue}'),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            context.read<EventsCubit>().toggleRegistration(event.id);
                            final message = event.isRegistered
                                ? 'Registration cancelled'
                                : 'Successfully registered';
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                          },
                          child: Text(event.isRegistered ? 'Cancel registration' : 'Register'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
