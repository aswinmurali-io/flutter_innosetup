// ignore: public_member_api_docs
enum InnoSetupPrivilegeRequired {
  // ignore: public_member_api_docs
  lowest,
  // ignore: public_member_api_docs
  admin,
}

/// Define the installer's privilege requirement and override behaviors.
class InnoSetupPrivileges {
  /// Define the installer's privilege requirement and override behaviors.
  InnoSetupPrivileges({
    required this.required,
    required this.overrideByCommandline,
    required this.overrideByDialog,
  });

  /// Default privilege requirement
  final InnoSetupPrivilegeRequired required;

  /// Privilege could changed by commandline using `/ALLUSERS` and `/CURRENTUSER`
  final bool overrideByCommandline;

  /// Privilege could changed by a dialog popup when user running the installer
  final bool overrideByDialog;

  @override
  String toString() => '''
PrivilegesRequired=${required.name}
PrivilegesRequiredOverridesAllowed=${overrideByCommandline ? 'commandline ' : ''}${overrideByDialog ? 'dialog' : ''}
''';
}
