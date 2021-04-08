abstract class ChannelEvent {}

// region -- Channel Message Load Event
class ChannelMessageLoadStarted extends ChannelEvent {}

class ChannelMessageLoaded extends ChannelEvent {}

class ChannelMessageLoadFailed extends ChannelEvent {}
// endregion

// region -- Channel Info Load Info
class ChannelInfoLoadStarted extends ChannelEvent {}

class ChannelInfoLoaded extends ChannelEvent {}

class ChannelInfoLoadFailed extends ChannelEvent {}
// endregion
