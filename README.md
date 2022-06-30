# Flutter Inno Setup

Make windows installer for flutter powered apps.

## Installing

Run this command:

With Dart:

```sh
 $ dart pub add innosetup
```

With Flutter:

```sh
 $ flutter pub add innosetup
```

## Simple Usage

```dart
import 'dart:io';

import 'package:innosetup/innosetup.dart';

void main() {
  InnoSetup(
    name: const InnoSetupName('windows_installer'),
    location: InnoSetupInstallerDirectory(Directory('build/windows')),
    icon: InnoSetupIcon(File('assets/icon.ico')),
  ).make();
}
```

## Advanced Usage

```dart
import 'dart:io';

import 'package:innosetup/innosetup.dart';

void main() {
  InnoSetup(
    name: const InnoSetupName(
      'windows_installer',
    ),
    location: InnoSetupInstallerDirectory(
      Directory('build/windows'),
    ),
    icon: InnoSetupIcon(
      File('assets/icon.ico'),
    ),
    compression: InnoSetupCompressions().lzma2(
      InnoSetupCompressionLevel.ultra64,
    ),
    languages: InnoSetupLanguages().all,
    license: InnoSetupLicense(
      File('LICENSE'),
    ),
  ).make();
}
```

## Setup

```sh
git clone https://github.com/aswinmurali-io/flutter_innosetup.git
cd flutter_innosetup
dart pub get
```
