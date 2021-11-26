import 'package:discord_replicate/model/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:collection/collection.dart';

void main() {
  test('Group map', () {
    var users = getUserData();
    var grouppedUsers = users.groupListsBy((e) => e.status);
    print(grouppedUsers);
  });
}

List<UserData> getUserData() {
  return List.generate(15, (index) => UserData(name: "$index", status: UserStatus.values[index % 5]));
}
