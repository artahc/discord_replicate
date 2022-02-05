import 'package:discord_replicate/bloc/message/message_bloc.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/view/home/message_tile.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

final Logger log = Logger();

class MessagePanel extends StatefulWidget {
  final Channel channel;
  final OverlapSwipeableStackController pageController;

  const MessagePanel({Key? key, required this.pageController, required this.channel}) : super(key: key);

  @override
  _MessagePanelState createState() => _MessagePanelState();
}

class _MessagePanelState extends State<MessagePanel> {
  late MessageBloc _messageBloc = MessageBloc(
    channel: widget.channel,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageBloc>(
      create: (context) => _messageBloc,
      child: Container(
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.only(right: 15, left: 10),
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            if (widget.pageController.currentPageState == PageState.OnCenter)
                              widget.pageController.animateTo(PageState.OnRight);
                            else
                              widget.pageController.animateTo(PageState.OnCenter);
                          },
                          iconSize: 18,
                          icon: ImageIcon(
                            AssetImage(AppIcons.menu_icon),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                widget.channel.name,
                                style: Theme.of(context).textTheme.headline6?.copyWith(overflow: TextOverflow.clip),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          IconButton(
                            iconSize: 18,
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(AppIcons.phone_icon),
                            ),
                          ),
                          IconButton(
                            iconSize: 18,
                            onPressed: () {},
                            visualDensity: VisualDensity.compact,
                            icon: ImageIcon(
                              AssetImage(AppIcons.video_icon),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (widget.pageController.currentPageState == PageState.OnCenter)
                                widget.pageController.animateTo(PageState.OnLeft);
                              else
                                widget.pageController.animateTo(PageState.OnCenter);
                            },
                            visualDensity: VisualDensity.compact,
                            iconSize: 20,
                            icon: ImageIcon(
                              AssetImage(AppIcons.group_icon),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MessagePanelBody(key: UniqueKey()),
                MessagePanelInput(key: UniqueKey()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MessagePanelBody extends StatefulWidget {
  MessagePanelBody({Key? key}) : super(key: key);

  @override
  _MessagePanelBodyState createState() => _MessagePanelBodyState();
}

class _MessagePanelBodyState extends State<MessagePanelBody> {
  final ScrollController _scrollCtrl = ScrollController(keepScrollOffset: false, initialScrollOffset: 0);

  bool _pinScrollToBottom = false;

  late List<Message> _messages = [];
  late List<Message> _pendingMessage = [];

  @override
  void initState() {
    _scrollCtrl.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }

  _onScroll() {
    if (!_pinScrollToBottom && _scrollCtrl.offset <= (_scrollCtrl.position.minScrollExtent * 0.1)) {
      setState(() {
        _pinScrollToBottom = true;
      });
    } else if (_pinScrollToBottom && _scrollCtrl.offset > (_scrollCtrl.position.minScrollExtent * 0.1)) {
      setState(() {
        _pinScrollToBottom = false;
      });
    }
  }

  _onMessageFetched(List<Message> messages) {
    setState(() {
      _messages.addAll(messages);
    });
  }

  _onSendingMessage(Message message) {
    setState(() {
      _pendingMessage.add(message);
    });
    _scrollCtrl.animateTo(_scrollCtrl.position.minScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  _onReceiveNewMessage(Message message) async {
    if (_pendingMessage.where((element) => element.contentHash == message.contentHash).isNotEmpty)
      setState(() {
        _pendingMessage.removeWhere((element) => element.contentHash == message.contentHash);
        _messages.add(message);
      });

    if (_pinScrollToBottom) {
      _scrollCtrl.animateTo(_scrollCtrl.position.minScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    var messages = _messages.reversed.toList()..insertAll(0, _pendingMessage.reversed);
    return BlocListener<MessageBloc, MessageState>(
      listener: (_, state) {
        state.whenOrNull(
          messageFetched: (messages) => _onMessageFetched(messages),
          sendingMessage: (message) => _onSendingMessage(message),
          receivedNewMessage: (message) => _onReceiveNewMessage(message),
        );
      },
      child: Flexible(
        flex: 1,
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: _scrollCtrl,
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              return MessageTile(message: messages[index]);
            },
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}

class MessagePanelInput extends StatefulWidget {
  MessagePanelInput({Key? key}) : super(key: key);

  @override
  _MessagePanelInputState createState() => _MessagePanelInputState();
}

class _MessagePanelInputState extends State<MessagePanelInput> {
  final TextEditingController _inputCtrl = TextEditingController();
  late MessageBloc _messageBloc = BlocProvider.of<MessageBloc>(context);

  bool _isInputEmpty = true;

  @override
  void initState() {
    super.initState();
    _inputCtrl.addListener(
      () {
        if (_isInputEmpty != _inputCtrl.text.isEmpty) {
          setState(() {
            _isInputEmpty = _inputCtrl.text.isEmpty;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Wrap(
            spacing: 5,
            children: [
              ClipOval(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: IconButton(
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    icon: ImageIcon(
                      AssetImage(AppIcons.picture_icon),
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: IconButton(
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    icon: ImageIcon(
                      AssetImage(AppIcons.gift_icon),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Align(
              child: AppInputField(
                controller: _inputCtrl,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                margin: const EdgeInsets.only(right: 5, left: 5),
                height: 40,
                backgroundColor: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(50),
                hintText: "Message #channel",
                hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                      height: 1.2,
                    ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ImageIcon(
                    AssetImage(AppIcons.emoji_icon),
                    size: 20,
                    color: IconTheme.of(context).color,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !_isInputEmpty,
            child: ClipOval(
              child: Container(
                color: Theme.of(context).buttonTheme.colorScheme?.primary,
                child: IconButton(
                  onPressed: () {
                    // var message = TextMessage(id: "anjiay", date: DateTime.now(), message: _inputCtrl.text, senderId: "meh");
                    _messageBloc.add(MessageEvent.sendMessage(_inputCtrl.text));
                    _inputCtrl.clear();
                  },
                  visualDensity: VisualDensity.compact,
                  iconSize: 20,
                  icon: Icon(Icons.send, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
