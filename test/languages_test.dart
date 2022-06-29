import 'dart:io';

import 'package:innosetup/innosetup.dart';
import 'package:test/test.dart';

void main() {
  test('Known Test language directive.', () {
    final japanese = InnoSetupLanguage('japanese');

    const iss =
        r'Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"';

    expect(japanese.toString(), iss);
  });

  test('Custom Test language directive.', () {
    final custom = InnoSetupLanguage.custom('custom', File('custom.isl'));

    const iss = 'Name: "custom"; MessagesFile: "custom.isl"';

    expect(custom.toString(), iss);
  });

  test('Checking all known language directive.', () {
    final languages = InnoSetupLanguages();

    print(languages.values);
  });

  test('Custom Test language directive.', () {
    final custom = InnoSetupLanguage.custom('custom', File('custom.isl'));

    const iss = 'Name: "custom"; MessagesFile: "custom.isl"';

    expect(custom.toString(), iss);
  });
}
