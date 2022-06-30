# Flutter Inno Setup

Make windows installer for Flutter & vanilla Dart powered apps powered by Inno Setup.

## Installing

Run this command:

With Dart:

```sh
dart pub add -d innosetup
```

With Flutter:

```sh
flutter pub add -d innosetup
```

## Simple Usage

```dart
InnoSetup(
  app: InnoSetupApp(
    name: 'Test App',
    version: Version.parse('0.1.0'),
    publisher: 'author',
    urls: InnoSetupAppUrls(
      homeUrl: Uri.parse('https://example.com/'),
    ),
  ),
  files: InnoSetupFiles(
    executable: File('build/windows/runner/test_app.exe'),
    location: Directory('build/windows/runner'),
  ),
  name: const InnoSetupName('windows_installer'),
  location: InnoSetupInstallerDirectory(
    Directory('build/windows'),
  ),
  icon: InnoSetupIcon(
    File('assets/icon.ico'),
  ),
).make();
```

## Advanced Usage

```dart
InnoSetup(
  name: const InnoSetupName(
    'windows_installer',
  ),
  app: InnoSetupApp(
    name: 'Test App',
    version: Version.parse('0.1.0'),
    publisher: 'author',
    urls: InnoSetupAppUrls(
      homeUrl: Uri.parse('https://example.com/home'),
      publisherUrl: Uri.parse('https://example.com/author'),
      supportUrl: Uri.parse('https://example.com/support'),
      updatesUrl: Uri.parse('https://example.com/updates'),
    ),
  ),
  files: InnoSetupFiles(
    executable: File('build/windows/runner/test_app.exe'),
    location: Directory('build/windows/runner'),
  ),
  location: InnoSetupInstallerDirectory(
    Directory('build/windows'),
  ),
  icon: InnoSetupIcon(
    File('assets/icon.ico'),
  ),
  runAfterInstall: false,
  compression: InnoSetupCompressions().lzma2(
    InnoSetupCompressionLevel.ultra64,
  ),
  languages: InnoSetupLanguages().all,
  license: InnoSetupLicense(
    File('LICENSE'),
  ),
).make();
```

## Source

```sh
git clone https://github.com/aswinmurali-io/flutter_innosetup.git
cd flutter_innosetup
dart pub get
```
