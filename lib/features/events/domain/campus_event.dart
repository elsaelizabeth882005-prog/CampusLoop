import 'package:equatable/equatable.dart';

class CampusEvent extends Equatable {
  const CampusEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.venue,
    this.isRegistered = false,
  });

  final String id;
  final String title;
  final String description;
  final String date;
  final String venue;
  final bool isRegistered;

  CampusEvent copyWith({bool? isRegistered}) => CampusEvent(
        id: id,
        title: title,
        description: description,
        date: date,
        venue: venue,
        isRegistered: isRegistered ?? this.isRegistered,
      );

  @override
  List<Object?> get props => [id, title, description, date, venue, isRegistered];
}
