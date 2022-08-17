import 'dart:io';

import 'package:innosetup/app.dart';

/// Specify the icon [_file] for the installer.
class InnoSetupIcon {
  /// Specify the icon [_file] for the installer.
  ///
  /// ```dart
  /// final icon = InnoSetupIcon(File(r'assets\icon.ico'));
  /// ```
  InnoSetupIcon(this._file);
  // : assert(file.existsSync(), 'Icon file must exist!');

  final File _file;

  @override
  String toString() => 'SetupIconFile=${_file.absolute.path}';
}

// ignore: public_member_api_docs
class InnoSetupIconsBuilder {
  // ignore: public_member_api_docs
  const InnoSetupIconsBuilder(this._app);

  final InnoSetupApp _app;

  @override
  String toString() => '''
[Icons]
Name: "{autoprograms}\\${_app.name}"; Filename: "{app}\\${_app.name}"
Name: "{autodesktop}\\${_app.name}"; Filename: "{app}\\${_app.name}"
''';

//   @override
//   String toString() => '''
// [Icons]
// Name: "{autoprograms}\\${_app.name}"; Filename: "{app}\\${_app.name}"
// Name: "{autodesktop}\\${_app.name}"; Filename: "{app}\\${_app.name}"; Tasks: desktopicon
// ''';
}
