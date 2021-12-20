import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

class User {
  late String name;
  late String uid;
}

class MyUser extends User {
  int someData;

  MyUser({required this.someData}) : super();

  @override
  void method() {}
}

Future main() async {
  test(
    "Class with mixin is distinguished as same type",
    () async {
      var myUser = MyUser(someData: 1);
      var isSameType = myUser is User;
      assert(isSameType == false);
    },
  );
}
