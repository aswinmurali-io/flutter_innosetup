import 'dart:io';

/// Define the app's files [location] and [executable] path.
class InnoSetupFiles {
  /// Define the app's files [location] and [executable] path.
  const InnoSetupFiles({
    required this.executable,
    required this.location,
  });

  /// App executable path.
  final File executable;

  /// All app files path.
  final Directory location;

  @override
  String toString() => '''
[Files]
Source: "${executable.absolute.path}"; DestDir: "{app}"; Flags: ignoreversion
Source: "${location.absolute.path}\\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
''';
}
