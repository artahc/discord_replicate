import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_query_operation.dart';
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Given 2 identical graphQL query, When both compared, Then should return true", () {
    var query = GetChannelQuery(id: "id", memberLimit: 30);
    var anotherQuery = GetChannelQuery(id: "id", memberLimit: 30);

    assert(query == anotherQuery);
  });

  test("Mixins", () async {
    var channelStore = InMemoryChannelStore();

    assert(await channelStore.exist("id") == false);
    await channelStore.save("id", Channel(id: "id", name: "name", userGroupRef: "userGroupRef"));

    assert(await channelStore.exist("id"));
  });
}
