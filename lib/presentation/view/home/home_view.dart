import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/presentation/view/home/bottom_navigation_bar.dart';
import 'package:discord_replicate/presentation/view/home/channel_info_panel.dart';
import 'package:discord_replicate/presentation/view/home/channel_message_panel.dart';
import 'package:discord_replicate/presentation/view/home/direct_message_panel.dart';
import 'package:discord_replicate/presentation/view/home/server_list_panel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum PageState { LEFT, CENTER, RIGHT }
enum SwipeDirection { LEFT, RIGHT }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  static const int _swipeDuration = 350; // animation duration in milli
  static const int _navbarAnimDuration = 250; // in milli
  // static const int _swipeVelocitySensitivity = 250; // velocity
  static const double _swipeThreshold = 0.5;

  late AnimationController _pageAnimController;
  late AnimationController _navBarAnimController;

  PageState _pageState = PageState.CENTER;
  SwipeDirection? _swipeDirection;

  PublishSubject<SwipeDirection> _swipeDirectionSubject = PublishSubject<SwipeDirection>();
  PublishSubject<PageState> _pageStateSubject = PublishSubject<PageState>();

  Tween<Offset> _tween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  @override
  void initState() {
    super.initState();
    _pageAnimController = AnimationController(duration: Duration(milliseconds: _swipeDuration), vsync: this);
    _navBarAnimController = AnimationController(duration: Duration(milliseconds: _navbarAnimDuration), vsync: this);

    _pageStateSubject.stream.listen((s) {
      _pageState = s;
    });

    _swipeDirectionSubject.stream.listen((s) {
      _swipeDirection = s;
      if (_pageState == PageState.CENTER) {
        _tween.begin = Offset.zero;
        _tween.end = _swipeDirection == SwipeDirection.RIGHT ? Offset(0.875, 0) : Offset(-0.875, 0);
      }
    });
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
      // backgroundColor: Color(0xff202226),
      backgroundColor: Theme.of(context).backgroundColor,
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
            _navBarAnimController.animateTo(1, curve: Curves.easeInOut);
          }
        },
        onHorizontalDragUpdate: (d) {
          Offset dir = d.localPosition - startOffset;
          double width = MediaQuery.of(context).size.width;
          double v = dir.dx.remap(0, _swipeDirection == SwipeDirection.LEFT ? -width : width, 0, 1);

          if (!(_swipeDirection == SwipeDirection.RIGHT && _pageState == PageState.RIGHT ||
              _swipeDirection == SwipeDirection.LEFT && _pageState == PageState.LEFT)) {
            _pageAnimController.value = (_pageState == PageState.CENTER ? v : 1 - v);
          }
        },
        onHorizontalDragEnd: (d) {
          // TODO: handle swipe based on velocity
          if (_pageAnimController.value > _swipeThreshold) {
            _pageAnimController.animateTo(1, curve: Curves.easeInSine).whenComplete(() {
              if (_pageState == PageState.CENTER)
                _pageStateSubject.add(_swipeDirection == SwipeDirection.RIGHT ? PageState.RIGHT : PageState.LEFT);
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
              Expanded(
                child: StreamBuilder<SwipeDirection?>(
                  stream: _swipeDirectionSubject.stream,
                  initialData: null,
                  builder: (c, s) {
                    return Stack(
                      children: [
                        Visibility(
                          visible: _swipeDirection == SwipeDirection.RIGHT && _pageState == PageState.CENTER ||
                              _pageState == PageState.RIGHT,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainInteractivity: false,
                          maintainSemantics: false,
                          child: Row(
                            children: [
                              ServerListPanel(),
                              DirectMessageListPanel(),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _swipeDirection == SwipeDirection.LEFT && _pageState == PageState.CENTER ||
                              _pageState == PageState.LEFT,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          child: ChannelInfoPanel(),
                        ),
                        Positioned.fill(
                          child: SlideTransition(
                            position: _tween
                                .animate(CurvedAnimation(parent: _pageAnimController, curve: Curves.easeInOutCubic)),
                            child: GestureDetector(
                              onTap: () {
                                _pageAnimController
                                    .animateTo(0)
                                    .whenComplete(() => _pageStateSubject.add(PageState.CENTER));
                                _navBarAnimController.animateTo(0);
                              },
                              child: ChannelMessagePanel(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SlideTransition(
                            child: HomeNavigationBar(),
                            position:
                                Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(_navBarAnimController),
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
