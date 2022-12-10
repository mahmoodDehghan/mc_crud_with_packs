import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('test mapper model', () {
    test('creation with null value check map', () {
      expect(() => Mapper().map(null), throwsA(isUnsupportedError));
    });
    test('creation with null value check reverse', () {
      expect(() => Mapper().reverse(null), throwsA(isUnsupportedError));
    });
  });
}
