# Split Flutter client

Flutter client for Android, iOS, and web.

## Initialize platform runners

The starter keeps generated platform folders out of the initial commit. From the repository root, run:

```bash
./scripts/bootstrap-flutter-platforms.sh
```

This generates the Android, iOS, and web runner folders without replacing the tracked Dart app files.

## Run

```bash
flutter pub get
flutter run -d chrome
```

Run `flutter doctor` for Android SDK or Xcode setup requirements.
