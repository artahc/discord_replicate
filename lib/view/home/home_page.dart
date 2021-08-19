import 'dart:async';

import 'package:discord_ui_practice/bloc/channel/channel_bloc.dart';
import 'package:discord_ui_practice/bloc/channel/channel_event.dart';
import 'package:discord_ui_practice/bloc/connectivity/connectivity_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/bloc/message/conversation_bloc.dart';
import 'package:discord_ui_practice/bloc/message/conversation_event.dart';
import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/bloc/server/server_event.dart';
import 'package:discord_ui_practice/bloc/user/user_bloc.dart';
import 'package:discord_ui_practice/view/home/channel_info_page/channel_info_page.dart';
import 'package:discord_ui_practice/view/home/channel_message_page/channel_message_page.dart';
import 'package:discord_ui_practice/view/home/home_navigation_bar.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/side_menu_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:discord_ui_practice/static/math.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

enum PageState { LEFT, CENTER, RIGHT }
enum SwipeDirection { LEFT, RIGHT }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const int _swipeDuration = 350; // animation duration in milli
  static const int _swipeVelocitySensitivity = 250; // velocity
  static const double _swipeThreshold = 0.5;

  AnimationController _pageAnimController;
  AnimationController _navBarAnimController;

  PageState _pageState = PageState.CENTER;
  SwipeDirection _swipeDirection;
  PublishSubject<SwipeDirection> _swipeDirectionSubject = PublishSubject<SwipeDirection>();
  PublishSubject<PageState> _pageStateSubject = PublishSubject<PageState>();

  Tween<Offset> _tween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  @override
  void initState() {
    super.initState();
    _pageAnimController = AnimationController(duration: Duration(milliseconds: _swipeDuration), vsync: this);
    _navBarAnimController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _pageState = PageState.CENTER;

    _pageStateSubject.stream.listen((state) {
      _pageState = state;
    });

    _swipeDirectionSubject.stream.listen((swipeDirection) {
      _swipeDirection = swipeDirection;
      if (_pageState == PageState.CENTER) {
        _tween.begin = Offset.zero;
        _tween.end = _swipeDirection == SwipeDirection.RIGHT ? Offset(0.875, 0) : Offset(-0.875, 0);
      }
    });

    BlocProvider.of<ConnectivityBloc>(context).add(ConnectivityInitiate());

    // context.read<ServerBloc>().add(ServerLoadAll());
    // context.read<DirectMessageBloc>().add(DirectMessageLoadAll());
    // context.read<ChannelBloc>().add(ChannelLoadMessage());
    // context.read<ConversationBloc>().add(ConversationLoad());
  }

  @override
  void dispose() {
    super.dispose();
    _swipeDirectionSubject.close();
    _pageStateSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    Offset startOffset = Offset.zero;
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
          var s = dir.dx.isNegative ? SwipeDirection.LEFT : SwipeDirection.RIGHT;
          _swipeDirectionSubject.add(s);

          if (s == SwipeDirection.RIGHT && _pageState == PageState.CENTER) {
            _navBarAnimController.animateTo(1);
          }
        },
        onHorizontalDragUpdate: (d) {
          Offset dir = d.localPosition - startOffset;
          double width = MediaQuery.of(context).size.width;
          double v = dir.dx.remap(0, _swipeDirection == SwipeDirection.LEFT ? -width : width, 0, 1);

          if (!(_swipeDirection == SwipeDirection.RIGHT && _pageState == PageState.RIGHT ||
              _swipeDirection == SwipeDirection.LEFT && _pageState == PageState.LEFT)) {
            _pageAnimController.value = _pageState == PageState.CENTER ? v : 1 - v;
          }
        },
        onHorizontalDragEnd: (d) {
          // todo: handle swipe based on velocity
          if (_pageAnimController.value > _swipeThreshold) {
            _pageAnimController.animateTo(1, curve: Curves.easeInSine).whenComplete(() {
              if (_pageState == PageState.CENTER) _pageStateSubject.add(_swipeDirection == SwipeDirection.RIGHT ? PageState.RIGHT : PageState.LEFT);
            });
          } else {
            _pageAnimController.animateTo(0, curve: Curves.easeInSine).whenComplete(() {
              _pageStateSubject.add(PageState.CENTER);
            });

            _navBarAnimController.animateTo(0);
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder(
                bloc: BlocProvider.of<ConnectivityBloc>(context),
                builder: (c, s) {
                  return Visibility(
                    visible: s is ConnectivityNotAvailable,
                    child: Container(
                      padding: EdgeInsets.only(top: 2, bottom: 8),
                      child: Text(
                        "Network connectivity is limited or unavailable.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: StreamBuilder<Tuple2<SwipeDirection, PageState>>(
                  stream: _swipeDirectionSubject.stream.withLatestFrom(_pageStateSubject.stream, (swipe, page) => Tuple2(swipe, page)),
                  initialData: Tuple2(SwipeDirection.RIGHT, PageState.CENTER),
                  builder: (c, s) {
                    return Stack(
                      children: [
                        Visibility(
                          visible: s.data.item1 == SwipeDirection.RIGHT && s.data.item2 == PageState.CENTER || s.data.item2 == PageState.RIGHT,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainInteractivity: false,
                          maintainSemantics: false,
                          child: SideMenuPage(),
                        ),
                        Visibility(
                          visible: s.data.item1 == SwipeDirection.LEFT && s.data.item2 == PageState.CENTER || s.data.item2 == PageState.LEFT,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          child: ChannelInfoPage(),
                        ),
                        Positioned.fill(
                          child: SlideTransition(
                            position: _tween.animate(CurvedAnimation(parent: _pageAnimController, curve: Curves.easeInOutCubic)),
                            child: GestureDetector(
                              onTap: () {
                                _pageAnimController.animateTo(0).whenComplete(() => _pageStateSubject.add(PageState.CENTER));
                              },
                              child: Stack(
                                children: [
                                  ChannelMessagePage(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SlideTransition(
                            child: HomeNavigationBar(),
                            position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(_navBarAnimController),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
