import 'dart:math';

class MessageData {
  final String id;
  final String userId;
  final String userName;
  final String avatarUrl;
  final String message;
  final DateTime createdAt;

  MessageData({this.id, this.userId, this.userName, this.avatarUrl, this.message, this.createdAt});

  static MessageData createDummy() {
    return MessageData(
      id: "dummyId" + Random().nextInt(100).toString(),
      avatarUrl: "url",
      createdAt: DateTime.now(),
      message:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
              "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "
              "scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into"
              " electronic typesetting, remaining essentially unchanged.",
      userId: "userId",
      userName: "userName",
    );
  }
}
