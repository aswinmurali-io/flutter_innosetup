import 'dart:io';

/// Specify the icon [file] for the installer.
class InnoSetupIcon {
  /// Specify the icon [file] for the installer.
  ///
  /// ```dart
  /// final icon = InnoSetupIcon(File(r'assets\icon.ico'));
  /// ```
  InnoSetupIcon(this.file) : assert(file.existsSync(), 'Icon file must exist!');

  /// The icon file.
  final File file;

  @override
  String toString() => 'SetupIconFile=${file.absolute.path}';
}
