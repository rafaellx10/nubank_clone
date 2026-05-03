# Nubank Clone

A Flutter UI clone inspired by Nubank app sections.

## Requirements

- Flutter stable (project tested with Flutter 3.32.4)
- Dart SDK compatible with `pubspec.yaml` (`^3.7.0`)

## Setup

1. Install Flutter and verify your environment:
   ```bash
   flutter doctor -v
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. If Android licenses are pending:
   ```bash
   flutter doctor --android-licenses
   ```

## Run

```bash
flutter run
```

Common targets:

- Web: `flutter run -d chrome`
- macOS: `flutter run -d macos`

## Validation

Run before opening PR or finalizing changes:

```bash
flutter analyze
flutter test
```

## OpenCode Workflow

This repository includes `AGENTS.md` with instructions for coding agents.

- Project stack and main paths
- Setup commands
- Required validation workflow
- Code conventions

## Project Structure

- `lib/main.dart` - app entry point
- `lib/pages/home/home_page.dart` - main home screen
- `lib/controllers/controller_home_page.dart` - home state controller
- `lib/utils/colors_standarts.dart` - color palette
