import 'package:innosetup/innosetup.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Test zip compression level via `InnoSetupCompression.range`',
    () {
      expect(
        InnoSetupCompression.range('zip', 1).toString(),
        'Compression=zip/1',
      );

      expect(
        InnoSetupCompression.range('zip', 9).toString(),
        'Compression=zip/9',
      );

      // Should cause assertion error because of range.
      expect(
        () => InnoSetupCompression.range('zip', 10).toString(),
        throwsA(isA<AssertionError>()),
      );
    },
  );

  final compression = InnoSetupCompressions();

  test(
    'Test bzip compression level via `InnoSetupCompressions.bzip`',
    () {
      expect(
        compression.bzip(1).toString(),
        'Compression=bzip/1',
      );

      expect(
        compression.bzip(9).toString(),
        'Compression=bzip/9',
      );

      // Should cause assertion error because of range.
      expect(
        () => compression.bzip(10).toString(),
        throwsA(isA<AssertionError>()),
      );
    },
  );

  test(
    'Test lzma compression level via `InnoSetupCompression.level`',
    () {
      expect(
        InnoSetupCompression.level('lzma', InnoSetupCompressionLevel.fast)
            .toString(),
        'Compression=lzma/fast',
      );

      expect(
        InnoSetupCompression.level('lzma', InnoSetupCompressionLevel.ultra64)
            .toString(),
        'Compression=lzma/ultra64',
      );
    },
  );

  test(
    'Test lzma2 compression level via `InnoSetupCompressions.lzma2`',
    () {
      expect(
        compression.lzma2(InnoSetupCompressionLevel.ultra64).toString(),
        'Compression=lzma2/ultra64',
      );

      expect(
        compression.lzma2(InnoSetupCompressionLevel.normal).toString(),
        'Compression=lzma2/normal',
      );
    },
  );
}
