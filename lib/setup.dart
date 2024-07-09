import 'dart:io';

import 'package:innosetup/desktopicon.dart';
import 'package:innosetup/innosetup.dart';

/// Define name of the installer.
class InnoSetupName {
  /// Define name of the installer.
  const InnoSetupName(this._name);

  final String _name;

  @override
  String toString() => 'OutputBaseFilename=$_name';
}

/// Define installer location when compiled.
class InnoSetupInstallerDirectory {
  /// Define installer location when compiled.
  InnoSetupInstallerDirectory(this._location);
  //  : assert(_location.existsSync(), 'Icon file must exist!');

  final Directory _location;

  @override
  String toString() => 'OutputDir=${_location.absolute.path}';
}

/// Define license to show when installing.
class InnoSetupLicense {
  /// Define license to show when installing.
  const InnoSetupLicense(this._license);

  final File _license;

  @override
  String toString() => 'LicenseFile=${_license.absolute.path}';
}

/// The Inno Setup installer definition block.
class InnoSetup {
  /// The Inno Setup installer definition block.
  const InnoSetup({
    required this.icon,
    this.compression = InnoSetupCompressions.none,
    this.privileges,
    this.languages,
    required this.name,
    required this.location,
    this.license,
    required this.app,
    required this.files,
    this.desktopIcon = false,
    this.runAfterInstall = true,
  });

  /// App details.
  final InnoSetupApp app;

  /// Installer icon.
  final InnoSetupIcon icon;

  /// Compresssion used to pack the contents in the installer.
  final InnoSetupCompression compression;

  /// Define the installer's privilege requirement and override behaviors.
  final InnoSetupPrivileges? privileges;

  /// Language support for the installer.
  final List<InnoSetupLanguage>? languages;

  /// Name of the output installer file.
  final InnoSetupName name;

  /// Location of the installer.
  final InnoSetupInstallerDirectory location;

  /// Specify app files.
  final InnoSetupFiles files;

  /// Show license when installing.
  final InnoSetupLicense? license;

  /// Asking create desktop icon or not
  final bool desktopIcon;

  /// Run app after installing.
  final bool runAfterInstall;

  /// Make the Inno Setup script. (innosetup.iss)
  Future<void> make({bool dry = false}) async {
    final iss = StringBuffer('''
[Setup]
$app
$compression
${privileges ?? ''}
$icon
$name
$location
${license ?? ''}

${InnoSetupLanguagesBuilder(languages)}

[Tasks]
${desktopIcon ? const InnoSetupDesktopIconBuilder() : ''}

$files

${InnoSetupIconsBuilder(app)}

${runAfterInstall ? InnoSetupRunBuilder(app) : ''}
''');

    final buildDirectory = Directory("build");

    if (!await buildDirectory.exists()) {
      await buildDirectory.create();
    }

    File('build/innosetup.iss').writeAsStringSync('$iss');

    if (!dry) {
      await Process.start(
        'iscc',
        ['build/innosetup.iss'],
        mode: ProcessStartMode.inheritStdio,
      );
    }
  }
}
