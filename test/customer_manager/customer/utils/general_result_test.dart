import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('test general_result model', () {
    test('creation with null value', () {
      const res = GeneralResult();
      expect(res.errorMessage, null);
      expect(res.result, null);
    });
    test('creation with map value', () {
      final map = <String, dynamic>{};
      map['test'] = 'test';
      final res =
          GeneralResult<Map<String, dynamic>>(result: map, errorMessage: '');
      expect(res.result, isA<Map<String, dynamic>>());
      expect((res.result as Map<String, dynamic>)['test'], 'test');
      expect(res.errorMessage, '');
    });

    test('creation success result', () {
      final map = <String, dynamic>{};
      map['test'] = 'test';
      final res = GeneralResult.successResult<Map<String, dynamic>>(map);
      expect(res.result, isA<Map<String, dynamic>>());
      expect((res.result as Map<String, dynamic>)['test'], 'test');
      expect(res.errorMessage, '');
    });

    test('creation failed result', () {
      final res = GeneralResult.failedResult<Map<String, dynamic>>('test');
      expect(res.result, null);
      expect(res.errorMessage, 'test');
    });

    test('has result true test', () {
      final map = <String, dynamic>{};
      map['test'] = 'test';
      final res2 = GeneralResult.successResult<Map<String, dynamic>>(map);
      expect(res2.hasResult(), true);
    });
    test('has result false test', () {
      final res = GeneralResult.failedResult<Map<String, dynamic>>('test');
      expect(res.hasResult(), false);
    });
  });
}
