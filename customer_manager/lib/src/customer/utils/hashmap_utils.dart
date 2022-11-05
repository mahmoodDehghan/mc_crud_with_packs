import 'package:customer_manager/customer_manager.dart';

class HashMapUtils {
  static String fetchStrictString(Map<String, dynamic> map, String key) {
    return map[key] ?? DefaultConsts.notProvidedString;
  }

  static int fetchStrictInt(Map<String, dynamic> map, String key) {
    return int.tryParse(map[key].toString()) ?? DefaultConsts.notProvidedInt;
  }
}
