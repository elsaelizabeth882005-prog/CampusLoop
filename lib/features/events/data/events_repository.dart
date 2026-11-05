import '../domain/campus_event.dart';

class EventsRepository {
  Future<List<CampusEvent>> fetchEvents() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    return const [
      CampusEvent(
        id: 'EVT001',
        title: 'TechFest 2026',
        description: 'A campus technology and innovation festival.',
        date: '12 November 2026',
        venue: 'Main Auditorium',
      ),
      CampusEvent(
        id: 'EVT002',
        title: 'Sports Meet',
        description: 'Inter-department sports competitions.',
        date: '18 November 2026',
        venue: 'College Ground',
      ),
      CampusEvent(
        id: 'EVT003',
        title: 'Arts Evening',
        description: 'Music, dance and student performances.',
        date: '25 November 2026',
        venue: 'Open Stage',
      ),
    ];
  }
}
