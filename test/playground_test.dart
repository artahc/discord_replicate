import 'dart:convert';

import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_query_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var query = GetChannelQuery(id: "id", memberLimit: 30);
  var anotherQuery = GetChannelQuery(id: "id", memberLimit: 30);

  test("Given 2 identical graphQL query, When both compared, Then should return true", () {
    assert(query == anotherQuery);
  });
}
