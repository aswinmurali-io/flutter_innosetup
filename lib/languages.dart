import 'dart:io';

/// Defines a language in inno setup.
///
/// Refer [InnoSetupLanguage], [InnoSetupLanguage.custom]
///
class InnoSetupLanguage {
  /// Defines a language in Inno Setup. Example: -
  ///
  /// ```dart
  /// final japanese = InnoSetupLanguage('japanese');
  /// ```
  /// This generates language header as,
  /// ```innosetup
  /// Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
  /// ```
  InnoSetupLanguage(this.name)
      : file = File('$protocol:Languages\\${toFile(name)}');

  /// Define a custom language [name] with it's [file].
  const InnoSetupLanguage.custom(this.name, this.file);

  /// Get the language file from [name].
  static String toFile(String name) =>
      '${name[0].toUpperCase()}${name.substring(1)}.$extension';

  /// The language name.
  final String name;

  /// The language file.
  final File file;

  /// The language protocol.
  static const protocol = 'compiler';

  /// The language file extension.
  static const extension = 'isl';

  @override
  String toString() => 'Name: "$name"; MessagesFile: "${file.path}"';
}

/// Contains multiple language definitions for Inno Setup.
class InnoSetupLanguages {
  /// Contains multiple language definitions for Inno Setup.
  ///
  /// Returns a singletone class.
  factory InnoSetupLanguages() => _singleton;

  InnoSetupLanguages._();

  static final _singleton = InnoSetupLanguages._();

  /// List of all languages.
  List<InnoSetupLanguage> get all {
    return [
      english,
      armenian,
      brazilianportuguese,
      bulgarian,
      catalan,
      corsican,
      czech,
      danish,
      dutch,
      finnish,
      french,
      german,
      hebrew,
      icelandic,
      italian,
      japanese,
      norwegian,
      polish,
      portuguese,
      russian,
      slovak,
      slovenian,
      spanish,
      turkish,
      ukrainian,
    ];
  }

  final english = InnoSetupLanguage.custom(
    'english',
    File('${InnoSetupLanguage.protocol}:Default.isl'),
  );

  final armenian = InnoSetupLanguage('armenian');

  final brazilianportuguese = InnoSetupLanguage('brazilianportuguese');

  final bulgarian = InnoSetupLanguage('bulgarian');

  final catalan = InnoSetupLanguage('catalan');

  final corsican = InnoSetupLanguage('corsican');

  final czech = InnoSetupLanguage('czech');

  final danish = InnoSetupLanguage('danish');

  final dutch = InnoSetupLanguage('dutch');

  final finnish = InnoSetupLanguage('finnish');

  final french = InnoSetupLanguage('french');

  final german = InnoSetupLanguage('german');

  final hebrew = InnoSetupLanguage('hebrew');

  final icelandic = InnoSetupLanguage('icelandic');

  final italian = InnoSetupLanguage('italian');

  final japanese = InnoSetupLanguage('japanese');

  final norwegian = InnoSetupLanguage('norwegian');

  final polish = InnoSetupLanguage('polish');

  final portuguese = InnoSetupLanguage('portuguese');

  final russian = InnoSetupLanguage('russian');

  final slovak = InnoSetupLanguage('slovak');

  final slovenian = InnoSetupLanguage('slovenian');

  final spanish = InnoSetupLanguage('spanish');

  final turkish = InnoSetupLanguage('turkish');

  final ukrainian = InnoSetupLanguage('ukrainian');
}

// ignore: public_member_api_docs
class InnoSetupLanguagesBuilder {
  // ignore: public_member_api_docs
  const InnoSetupLanguagesBuilder(this._languages);

  final List<InnoSetupLanguage>? _languages;

  @override
  String toString() {
    final code = StringBuffer('[Languages]\n');

    for (final lang in _languages ?? [InnoSetupLanguages().english]) {
      code.writeln('$lang');
    }

    return '$code';
  }
}
