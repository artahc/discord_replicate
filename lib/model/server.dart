import 'package:discord_replicate/model/channel.dart';
import 'package:hive/hive.dart';

part 'server.g.dart';

@HiveType(typeId: 1)
class Server extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Channel> channels;

  Server({required this.id, required this.name, this.channels = const []});

  factory Server.dummy(int id) => Server(id: "serverId_$id", name: "name", channels: [Channel.dummy()]);

  factory Server.fromJson(Map<String, dynamic> map) {
    var id = map["id"] as String;
    var name = map["name"] as String;
    var channels = (map["channels"] as List<Object?>).map((e) {
      var channel = e as Map<String, dynamic>;
      return Channel.fromJson(channel);
    }).toList();

    return Server(
      id: id,
      name: name,
      channels: channels,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "channels": channels.toList(),
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
