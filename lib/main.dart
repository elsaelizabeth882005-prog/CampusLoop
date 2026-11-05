import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'features/events/cubit/events_cubit.dart';
import 'features/events/data/events_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    RepositoryProvider(
      create: (_) => EventsRepository(),
      child: BlocProvider(
        create: (context) => EventsCubit(
          context.read<EventsRepository>(),
        )..loadEvents(),
        child: const CampusLoopApp(),
      ),
    ),
  );
}
