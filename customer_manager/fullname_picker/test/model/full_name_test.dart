import 'package:flutter_test/flutter_test.dart';
import 'package:fullname_picker/src/model/full_name.dart';

void main() {
  test('full name initialization', () {
    const name = "mahmood";
    const lName = "dehghan";
    const fn = FullName(
      firstName: name,
      lastName: lName,
    );
    expect(fn.fullName, "$name $lName");
  });
}
