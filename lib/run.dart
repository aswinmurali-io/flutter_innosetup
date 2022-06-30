import 'package:innosetup/innosetup.dart';

// ignore: public_member_api_docs
class InnoSetupRunBuilder {
  // ignore: public_member_api_docs
  const InnoSetupRunBuilder(this._app);

  final InnoSetupApp _app;

  @override
  String toString() => '''
[Run]
Filename: "{app}\\${_app.name}"; Description: "{cm:LaunchProgram,${_app.name}}"; Flags: nowait postinstall skipifsilent
''';
}
