import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'server.g.dart';

@HiveType(typeId: HiveConstants.SERVER_TYPE)
class Server extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  final List<Channel> channels;

  Server({required this.id, required this.name, required this.imageUrl, this.channels = const []});

  factory Server.dummy(int id) => Server(id: "serverId_$id", name: "name", imageUrl: "image-url", channels: [Channel.dummy()]);

  factory Server.fromJson(Map<String, dynamic> map) {
    try {
      var id = map["id"] as String;
      var name = map["name"] as String;
      var imageUrl = map["imageUrl"] as String?;
      var channels = <Channel>[];
      if (map.containsKey("channels") && (map['channels'] as List<Object?>).isNotEmpty)
        channels = (map["channels"] as List<Object?>).map((e) {
          var channel = e as Map<String, dynamic>;
          return Channel.fromJson(channel);
        }).toList();

      return Server(
        id: id,
        name: name,
        imageUrl: imageUrl,
        channels: channels,
      );
    } catch (e) {
      throw Exception("Error parsing Server from JSON.");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imageUrl": imageUrl,
      "channels": channels.toList(),
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
