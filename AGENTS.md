# AGENTS

## Stack
- Flutter app (Dart)
- Main entry: `lib/main.dart`
- Home screen: `lib/pages/home/home_page.dart`

## Setup
1. Install Flutter stable and ensure `flutter doctor -v` is healthy.
2. Install dependencies:
   - `flutter pub get`
3. If Android toolchain reports pending licenses:
   - `flutter doctor --android-licenses`

## Validation Workflow
Before finishing any change, always run:
1. `flutter analyze`
2. `flutter test`

## Code Conventions
- Keep file names in `lower_case_with_underscores`.
- Avoid `print` in production widgets.
- Prefer immutable widgets and `final` fields in `StatelessWidget` classes.

## Suggested Run Commands
- Run app (connected device): `flutter run`
- Run app on web: `flutter run -d chrome`
- Run app on macOS: `flutter run -d macos`
