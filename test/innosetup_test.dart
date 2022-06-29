import 'package:innosetup/innosetup.dart';
import 'package:test/test.dart';

void main() {
  test('Test language directive.', () {
    final japanese = InnoSetupLanguage('japanese');

    const iss =
        r'Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"';

    expect(japanese.toString(), iss);
  });
}
