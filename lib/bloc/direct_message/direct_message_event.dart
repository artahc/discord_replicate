abstract class DirectMessageEvent {}

class DirectMessageLoadAll extends DirectMessageEvent {}

class DirectMessageLoadSelected extends DirectMessageEvent {}

abstract class DirectMessageState {}

class DirectMessageInitial extends DirectMessageState {}

class DirectMessageLoadAllSuccess extends DirectMessageState {}

class DirectMessageLoadSelectedSuccess extends DirectMessageState {}
