import 'package:equatable/equatable.dart';
import '../domain/campus_event.dart';

enum EventsStatus { initial, loading, success, failure }

class EventsState extends Equatable {
  const EventsState({
    this.status = EventsStatus.initial,
    this.events = const [],
    this.message = '',
  });

  final EventsStatus status;
  final List<CampusEvent> events;
  final String message;

  EventsState copyWith({
    EventsStatus? status,
    List<CampusEvent>? events,
    String? message,
  }) {
    return EventsState(
      status: status ?? this.status,
      events: events ?? this.events,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, events, message];
}
