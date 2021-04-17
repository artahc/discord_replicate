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
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

enum PageState { LEFT, CENTER, RIGHT }
enum SwipeDirection { LEFT, RIGHT }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static const int _swipeDuration = 350; // animation duration in milli
  static const int _swipeSensitivity = 250; // velocity
  static const double _swipeThreshold = 0.5;

  AnimationController _animationController;

  PageState _pageState = PageState.CENTER;
  SwipeDirection _swipeDirection;

  PublishSubject<SwipeDirection> _swipeDirectionSubject = PublishSubject<SwipeDirection>();
  PublishSubject<PageState> _pageStateSubject = PublishSubject<PageState>();

  Stream<SwipeDirection> get _swipeDirectionStream => _swipeDirectionSubject.stream;

  Stream<PageState> get _pageStateStream => _pageStateSubject.stream;

  Tween<Offset> _tween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: _swipeDuration), vsync: this);
    _pageState = PageState.CENTER;

    _pageStateStream.listen((state) {
      _pageState = state;
    });

    _swipeDirectionStream.listen((swipeDirection) {
      _swipeDirection = swipeDirection;

      if (_pageState == PageState.CENTER) {
        _tween.begin = Offset.zero;
        _tween.end = _swipeDirection == SwipeDirection.RIGHT ? Offset(0.88, 0) : Offset(-0.88, 0);
      }
    });

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
      body: Container(
        child: GestureDetector(
          dragStartBehavior: DragStartBehavior.start,
          onTapDown: (d) {},
          onHorizontalDragDown: (d) {
            startOffset = d.localPosition;
          },
          onHorizontalDragStart: (d) {
            var dir = d.localPosition - startOffset;
            _swipeDirectionSubject.add(dir.dx.isNegative ? SwipeDirection.LEFT : SwipeDirection.RIGHT);
          },
          onHorizontalDragUpdate: (d) {
            Offset dir = d.localPosition - startOffset;
            double width = MediaQuery.of(context).size.width;
            double v = dir.dx.remap(0, _swipeDirection == SwipeDirection.LEFT ? -width : width, 0, 1);

            if (!(_swipeDirection == SwipeDirection.RIGHT && _pageState == PageState.RIGHT ||
                _swipeDirection == SwipeDirection.LEFT && _pageState == PageState.LEFT))
              _animationController.value = _pageState == PageState.CENTER ? v : 1 - v;
          },
          onHorizontalDragEnd: (d) {
            // todo: handle swipe based on velocity
            if (_animationController.value > _swipeThreshold) {
              _animationController.animateTo(1, curve: Curves.easeInSine).whenComplete(() {
                if (_pageState == PageState.CENTER)
                  _pageStateSubject.add(_swipeDirection == SwipeDirection.RIGHT ? PageState.RIGHT : PageState.LEFT);
              });
            } else {
              _animationController.animateTo(0, curve: Curves.easeInSine);
              _pageStateSubject.add(PageState.CENTER);
            }
          },
          child: StreamBuilder<Tuple2>(
              stream: _swipeDirectionStream.withLatestFrom(
                  _pageStateStream, (swipeDirection, pageState) => Tuple2(swipeDirection, pageState)),
              initialData: Tuple2(SwipeDirection.RIGHT, PageState.CENTER),
              builder: (c, AsyncSnapshot<Tuple2> s) {
                return Stack(
                  children: [
                    // StreamBuilder(
                    //   stream: _swipeDirectionStream,
                    //   builder: (c, AsyncSnapshot<SwipeDirection> s) {
                    //     return s.data == SwipeDirection.RIGHT ? SideMenuPage() : ChannelInfoPage();
                    //   },
                    // ),
                    //
                    Visibility(
                      visible: s.data.item1 == SwipeDirection.RIGHT && s.data.item2 == PageState.CENTER ||
                          s.data.item2 == PageState.RIGHT,
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      child: SideMenuPage(),
                    ),
                    Visibility(
                      visible: s.data.item1 == SwipeDirection.LEFT && s.data.item2 == PageState.CENTER ||
                          s.data.item2 == PageState.LEFT,
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      child: ChannelInfoPage(),
                    ),
                    SlideTransition(
                      position:
                          _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic)),
                      child: GestureDetector(
                        onTap:() {
                          _animationController.animateTo(0).whenComplete(() {
                            _pageStateSubject.add(PageState.CENTER);
                          });
                        },
                        child: ChannelMessagePage(),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
