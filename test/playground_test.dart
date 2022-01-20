import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Datetime to epoch", () {
    var date = DateTime.fromMillisecondsSinceEpoch(1642674229000);
    print(date);
  });
}
