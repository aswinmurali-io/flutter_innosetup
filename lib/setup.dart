import 'package:innosetup/innosetup.dart';

/// The Inno Setup installer definition block.
class InnoSetup {
  /// The Inno Setup installer definition block.
  const InnoSetup({
    required this.icon,
    required this.compression,
  });

  /// Installer icon.
  final InnoSetupIcon icon;

  /// Compresssion used to pack the contents in the installer.
  final InnoSetupCompression compression;
}
