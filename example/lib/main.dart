import 'dart:io';

import 'package:innosetup/innosetup.dart';
import 'package:version/version.dart';

void main() {
  // --------------------------------------------------------------------------
  // Simple Usage
  // --------------------------------------------------------------------------
  InnoSetup(
    app: InnoSetupApp(
      name: 'Test App',
      executable: 'test_app.exe',
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

  // --------------------------------------------------------------------------
  // Complex Usage
  // --------------------------------------------------------------------------
  InnoSetup(
    name: const InnoSetupName(
      'windows_installer',
    ),
    app: InnoSetupApp(
      name: 'Test App',
      executable: 'test_app.exe',
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
}
