import 'package:discord_ui_practice/bloc/channel/channel_bloc.dart';
import 'package:discord_ui_practice/bloc/channel/channel_event.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/bloc/message/conversation_bloc.dart';
import 'package:discord_ui_practice/bloc/message/conversation_event.dart';
import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/bloc/server/server_event.dart';
import 'package:discord_ui_practice/view/home/channel_info_page/channel_info_page.dart';
import 'package:discord_ui_practice/view/home/channel_message_page/channel_message_page.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/side_menu_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:discord_ui_practice/static/math.dart';

enum PageState { LEFT, CENTER, RIGHT }
enum SwipeDirection { LEFT, RIGHT }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static const int _pageAnimationDuration = 350;
  static const int _velocitySensitivity = 450;
  static const double _pageOffsetThreshold = 0.5;

  AnimationController _animationController;
  PageState _channelPageState;
  Animation<Offset> _offsetAnim;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: _pageAnimationDuration), vsync: this);
    _channelPageState = PageState.CENTER;

    // context.read<ServerBloc>().add(ServerLoadAll());
    // context.read<DirectMessageBloc>().add(DirectMessageLoadAll());
    // context.read<ChannelBloc>().add(ChannelLoadMessage());
    // context.read<ConversationBloc>().add(ConversationLoad());
  }

  @override
  Widget build(BuildContext context) {
    Offset startOffset = Offset.zero;
    SwipeDirection _swipeDirection = null;

    Tween<Offset> _tween = Tween<Offset>(begin: Offset(0, 0), end: _swipeDirection == SwipeDirection.RIGHT ? Offset(0.88, 0) : Offset(0.88, 0));
    return Scaffold(
      backgroundColor: Color(0xff202226),
      body: GestureDetector(
        dragStartBehavior: DragStartBehavior.start,
        onTapDown: (d) {},
        onHorizontalDragDown: (d) {
          startOffset = d.localPosition;
        },
        onHorizontalDragStart: (d) {
          var dir = d.localPosition - startOffset;

          _swipeDirection = dir.dx.isNegative ? SwipeDirection.LEFT : SwipeDirection.RIGHT;
          _tween.begin = Offset.zero;
          _tween.end = _swipeDirection == SwipeDirection.LEFT ? Offset(-0.88, 0) : Offset(0.88, 0);
        },
        onHorizontalDragUpdate: (d) {
          Offset dir = d.localPosition - startOffset;
          double width = MediaQuery.of(context).size.width;
          double v = dir.dx.remap(0, _swipeDirection == SwipeDirection.LEFT ? -width : width, 0, 1);

          _animationController.value = v;
        },
        onHorizontalDragEnd: (d) {
          if (_animationController.value > _pageOffsetThreshold || d.velocity.pixelsPerSecond.dx > _velocitySensitivity) {
            _animationController.animateTo(1, curve: Curves.easeInSine);
          } else {
            _animationController.animateTo(0, curve: Curves.easeInSine);
            print(_swipeDirection);
          }
        },
        child: Container(
          child: Stack(
            children: [
              SideMenuPage(),
              ChannelInfoPage(),
              SlideTransition(
                position: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutSine)),
                child: ChannelMessagePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
