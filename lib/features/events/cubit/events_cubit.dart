import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/events_repository.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this._repository) : super(const EventsState());

  final EventsRepository _repository;

  Future<void> loadEvents() async {
    emit(state.copyWith(status: EventsStatus.loading));
    try {
      final events = await _repository.fetchEvents();
      emit(state.copyWith(status: EventsStatus.success, events: events));
    } catch (_) {
      emit(state.copyWith(status: EventsStatus.failure, message: 'Could not load events.'));
    }
  }

  void toggleRegistration(String eventId) {
    final updated = state.events.map((event) {
      if (event.id == eventId) {
        return event.copyWith(isRegistered: !event.isRegistered);
      }
      return event;
    }).toList();

    emit(state.copyWith(events: updated));
  }

  List get registeredEvents => state.events.where((event) => event.isRegistered).toList();
}
