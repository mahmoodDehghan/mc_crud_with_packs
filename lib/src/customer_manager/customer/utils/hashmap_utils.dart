import 'package:mc_crud/mc_crud.dart';

class HashMapUtils {
  static String fetchStrictString(Map<String, dynamic> map, String key) {
    return map[key] ?? DefaultConsts.notProvidedString;
  }

  static int fetchStrictInt(Map<String, dynamic> map, String key) {
    return int.tryParse(map[key].toString()) ?? DefaultConsts.notProvidedInt;
  }
}
