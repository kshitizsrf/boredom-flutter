# Boredom

A playful Flutter app that helps you stop overthinking and discover something fun to do when you're bored.

## Overview

Boredom is a lightweight activity recommendation app built with Flutter. It fetches random activities from the Bored API, presents them in a polished card UI, and enhances each suggestion with a related Wikipedia image for visual context. The app is designed to feel cheerful, modern, and easy to use.

## Features

- Random activity generation from the Bored API
- Activity cards with title, category/type, and participant count
- Visual loading shimmer while an image is being retrieved
- Related image lookup using Wikimedia search results
- Shareable activity suggestions via the device share sheet
- Animated startup screen and themed UI inspired by playful productivity
- Multiple app assets and custom splash/icon configuration

## Tech Stack

- Flutter
- Dart
- HTTP package for API calls
- Share Plus for sharing activity cards
- Shimmer for loading states
- Material Design UI

## App Flow

1. The app opens on a landing screen with a dartboard-inspired hero graphic.
2. The user taps the main action button to open the activity screen.
3. The app requests a random activity from the Bored API.
4. A matching Wikimedia image is fetched based on the activity text.
5. The user can browse another suggestion or share the current one.

## Project Structure

```text
lib/
  main.dart
  models/
    activity.dart
  resources/
    colors.dart
    styles.dart
  screens/
    bored_screen.dart
    activity_screen.dart
  services/
    api_service.dart
  widgets/
    clickables.dart
    dartboard.dart
    fade_in_text.dart
    scale_in_text.dart
    typewriter_text.dart
assets/
  bored-girl-launcher.png
  bored-girl.png
  bored-boy.png
  dartboard.png
  dart.png
test/
  widget_test.dart
```

## Getting Started

### Prerequisites

- Flutter SDK installed
- An IDE such as VS Code or Android Studio
- Android/iOS/web simulator or physical device

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Run tests

```bash
flutter test
```

## API Integration

The app uses the public Bored API endpoint:

```text
https://bored.api.lewagon.com/api/activity/
```

It also queries Wikimedia for a related image using the activity name as a search term.

## Notes

This repository includes custom asset configuration for launcher icons and splash screens, as well as a themed presentation designed for a casual boredom-relief experience.

## License

This project is currently unlicensed and intended for personal or educational use unless otherwise specified.
