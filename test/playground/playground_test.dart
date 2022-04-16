import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_query_operation.dart';
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test("Given 2 identical graphQL query, When both compared, Then should return true", () {
    var query = GetChannelQuery(id: "id", memberLimit: 30);
    var anotherQuery = GetChannelQuery(id: "id", memberLimit: 30);

    assert(query == anotherQuery);
  });

  test("Mixins", () async {
    var channelStore = InMemoryChannelStore();

    assert(await channelStore.exist("id") == false);
    await channelStore.save("id", const Channel(id: "id", name: "name", userGroupRef: "userGroupRef"));

    assert(await channelStore.exist("id"));
  });

  test("Test", () async {
    var bar = MockBar();
    var foo = Foo(bar);

    when(() => bar.fromMemory()).thenAnswer((invocation) async => null);
    when(() => bar.fromDb()).thenAnswer((invocation) async => "found");

    var result = await foo.fetch();

    expect(result, "found");
  });
}

class MockBar extends Mock implements Bar {}

class Foo {
  final Bar bar;
  Foo(this.bar);

  Future<String> fetch() async {
    var memory = LazyStream(() {
      return Future.sync(() => bar.fromMemory()).asStream().where((event) => event != null).cast().doOnData((event) {
        print("found from memory");
      });
    });

    var db = LazyStream(() {
      return Future(() => bar.fromDb()).asStream().where((event) => event != null).cast().doOnData(
        (event) {
          print("found from db");
        },
      );
    });

    var result = await ConcatStream([memory, db]).firstWhere((element) => element != null);

    return result!;
  }
}

class Bar {
  FutureOr<String?> fromDb() async {
    return "found";
  }

  FutureOr<String?> fromMemory() async {
    return null;
  }
}
