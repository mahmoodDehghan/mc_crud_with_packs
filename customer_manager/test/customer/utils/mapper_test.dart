import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_test/flutter_test.dart';

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
