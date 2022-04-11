import 'dart:async';

import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/message/message_bloc.dart';
import 'package:discord_replicate/presentation/constants/icon_constants.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'message_tile.dart';

class MessagePanel extends StatefulWidget {
  final OverlapSwipeableStackController pageController;

  const MessagePanel({Key? key, required this.pageController}) : super(key: key);

  @override
  _MessagePanelState createState() => _MessagePanelState();
}

class _MessagePanelState extends State<MessagePanel> {
  late ChannelBloc channelBloc = BlocProvider.of(context);
  late final MessageBloc _messageBloc = sl.get(param1: channelBloc.stream.withInitialValue(channelBloc.state));

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => widget.pageController,
      child: BlocProvider<MessageBloc>(
        create: (context) => _messageBloc,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Column(
            children: const [
              MessagePanelHeader(),
              MessagePanelBody(),
              MessagePanelInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagePanelHeader extends StatelessWidget {
  const MessagePanelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChannelBloc channelBloc = BlocProvider.of(context);
    final OverlapSwipeableStackController pageController = Provider.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.only(right: 15, left: 10),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                if (pageController.currentPageState == PageState.OnCenter) {
                  pageController.animateTo(PageState.OnRight);
                } else {
                  pageController.animateTo(PageState.OnCenter);
                }
              },
              iconSize: 18,
              icon: const ImageIcon(
                AssetImage(AppIcons.menu_icon),
              ),
            ),
          ),
          BlocBuilder<ChannelBloc, ChannelState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Expanded(
                    child: Text("Still loading..."),
                  );
                },
                loaded: (channel) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Text(
                            channelBloc.currentChannel.name,
                            style: Theme.of(context).textTheme.headline6?.copyWith(overflow: TextOverflow.clip),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
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
                icon: const ImageIcon(
                  AssetImage(AppIcons.phone_icon),
                ),
              ),
              IconButton(
                iconSize: 18,
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: const ImageIcon(
                  AssetImage(AppIcons.video_icon),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (pageController.currentPageState == PageState.OnCenter) {
                    pageController.animateTo(PageState.OnLeft);
                  } else {
                    pageController.animateTo(PageState.OnCenter);
                  }
                },
                visualDensity: VisualDensity.compact,
                iconSize: 20,
                icon: const ImageIcon(
                  AssetImage(AppIcons.group_icon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessagePanelBody extends StatefulWidget {
  const MessagePanelBody({Key? key}) : super(key: key);

  @override
  _MessagePanelBodyState createState() => _MessagePanelBodyState();
}

class _MessagePanelBodyState extends State<MessagePanelBody> {
  final ScrollController _scrollCtrl = ScrollController(keepScrollOffset: false, initialScrollOffset: 0);

  bool _pinScroll = false;
  Timer? _debouncer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  _pinScrollToBottom() {
    if (!_pinScroll && _scrollCtrl.offset <= (_scrollCtrl.position.minScrollExtent * 0.1)) {
      setState(() {
        _pinScroll = true;
      });
    } else if (_pinScroll && _scrollCtrl.offset > (_scrollCtrl.position.minScrollExtent * 0.1)) {
      setState(() {
        _pinScroll = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
        var messages = [...state.messages, ...state.pendingMessages].reversed.toList();
        return Container(
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
        );
      }),
    );
  }
}

class MessagePanelInput extends StatefulWidget {
  const MessagePanelInput({Key? key}) : super(key: key);

  @override
  _MessagePanelInputState createState() => _MessagePanelInputState();
}

class _MessagePanelInputState extends State<MessagePanelInput> {
  final TextEditingController _inputCtrl = TextEditingController();
  late final MessageBloc _messageBloc = BlocProvider.of<MessageBloc>(context);

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
      padding: const EdgeInsets.all(8),
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
                    icon: const ImageIcon(
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
                    icon: const ImageIcon(
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
                    const AssetImage(AppIcons.emoji_icon),
                    size: 20,
                    color: IconTheme.of(context).color,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _inputCtrl.text.isNotEmpty,
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
                  icon: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
