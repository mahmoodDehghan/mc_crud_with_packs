import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('test hashfetch', () {
    Map<String, dynamic>? entry;
    setUpAll(() {
      entry = <String, dynamic>{};
    });
    test('fetch string with null value', () {
      expect(HashMapUtils.fetchStrictString(entry!, 'key'),
          DefaultConsts.notProvidedString);
    });
    test('fetch string with specific value', () {
      const tValue = 'KeyValue';
      entry!['key'] = tValue;
      expect(HashMapUtils.fetchStrictString(entry!, 'key'), tValue);
    });
    test('fetch int without value', () {
      expect(HashMapUtils.fetchStrictInt(entry!, 'key'),
          DefaultConsts.notProvidedInt);
    });
    test('fetch int with specific value', () {
      const int tValue = 1;
      entry!['key'] = tValue;
      expect(HashMapUtils.fetchStrictInt(entry!, 'key'), tValue);
    });
    tearDownAll(() {
      entry!.clear();
      entry = null;
    });
  });
}
