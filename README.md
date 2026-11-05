# CampusLoop – Flutter Starter Project

A VS Code-ready starter scaffold for the CampusLoop Smart Campus Companion.

## Included
- Flutter + Dart application structure
- BLoC/Cubit state management for campus events
- Named navigation with GoRouter
- Material 3 theme with light/dark theme support
- Dashboard, Planner, Events, Community and Profile screens
- Event registration/cancellation demonstrating state-dependent UI updates
- Django REST backend setup guide

## Important
This is a **starter scaffold**, not the completed production application. Authentication, live Django API calls,
database models, admin dashboard, push notifications and deployment still need to be implemented.

## Open in VS Code
1. Extract `CampusLoop.zip`.
2. Open the extracted `CampusLoop` folder in VS Code.
3. Install the Flutter and Dart VS Code extensions.
4. Open the terminal in VS Code.
5. Run:

```bash
flutter create .
flutter pub get
flutter run
```

If `flutter create .` asks to overwrite files, keep the existing `lib/` and `pubspec.yaml` files.
You can create platform folders with `flutter create --platforms=android,web,windows .` if needed.

## Suggested next steps
1. Build authentication and connect it to Django REST Framework.
2. Replace the sample event list with API data.
3. Add CRUD screens for lost-and-found and planner tasks.
4. Add local persistence and offline handling.
5. Add tests and prepare release builds.

## Tech stack
- Flutter / Dart
- flutter_bloc
- GoRouter
- Dio (API client dependency included)
- SharedPreferences (local settings dependency included)
- Django REST Framework (backend to be built separately)
