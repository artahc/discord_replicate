import 'package:discord_replicate/external/math_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:developer' as dev;

enum PageState { OnLeft, OnCenter, OnRight }
enum SwipeDirection { Left, Right }

class OverlapSwipeableStackController {
  static const int _swipeDuration = 350; // animation duration in milli
  static const int _navbarAnimDuration = 250; // in milli
  static const double _swipeThreshold = 0.5;

  late AnimationController pageAnimController;
  late AnimationController navBarAnimController;

  PublishSubject<SwipeDirection> swipeDirectionSubject = PublishSubject<SwipeDirection>();
  PublishSubject<PageState> pageStateSubject = PublishSubject<PageState>();

  PageState currentPageState = PageState.OnCenter;
  SwipeDirection? currentSwipeDirection;

  Tween<Offset> tween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);

  Offset _startOffset = Offset.zero;

  OverlapSwipeableStackController({required TickerProvider vsync}) {
    pageAnimController = AnimationController(duration: Duration(milliseconds: _swipeDuration), vsync: vsync);
    navBarAnimController = AnimationController(duration: Duration(milliseconds: _navbarAnimDuration), vsync: vsync);

    pageStateSubject.stream.listen((s) {
      currentPageState = s;
    });

    swipeDirectionSubject.stream.listen((s) {
      currentSwipeDirection = s;
      if (currentPageState == PageState.OnCenter) {
        tween.begin = Offset.zero;
        tween.end = currentSwipeDirection == SwipeDirection.Right ? Offset(0.875, 0) : Offset(-0.875, 0);
      }
    });
  }

  void onHorizontalDragDown(DragDownDetails d) {
    _startOffset = d.localPosition;
  }

  void onHorizontalDragStart(DragStartDetails d) {
    var dir = d.localPosition - _startOffset;
    var s = dir.dx.isNegative ? SwipeDirection.Left : SwipeDirection.Right;
    swipeDirectionSubject.add(s);

    if (s == SwipeDirection.Right && currentPageState == PageState.OnCenter) {
      navBarAnimController.animateTo(1, curve: Curves.easeInOut);
    }
  }

  void onHorizontalDragUpdate(DragUpdateDetails d, BuildContext context) {
    Offset dir = d.localPosition - _startOffset;
    double width = MediaQuery.of(context).size.width;
    double v = dir.dx.remap(0, currentSwipeDirection == SwipeDirection.Left ? -width : width, 0, 1);

    if (!(currentSwipeDirection == SwipeDirection.Right && currentPageState == PageState.OnRight ||
        currentSwipeDirection == SwipeDirection.Left && currentPageState == PageState.OnLeft)) {
      pageAnimController.value = (currentPageState == PageState.OnCenter ? v : 1 - v);
    }
  }

  void onHorizontalDragEnd(DragEndDetails d) {
    if (pageAnimController.value > _swipeThreshold) {
      pageAnimController.animateTo(1, curve: Curves.easeInSine).whenComplete(() {
        if (currentPageState == PageState.OnCenter)
          pageStateSubject.add(currentSwipeDirection == SwipeDirection.Right ? PageState.OnRight : PageState.OnLeft);
      });
    } else {
      pageAnimController.animateTo(0, curve: Curves.easeInSine).whenComplete(() {
        pageStateSubject.add(PageState.OnCenter);
      });

      navBarAnimController.animateTo(0);
    }
  }

  void setState(PageState pageState) {
    dev.log("Supposed to move until $pageState.", name: this.runtimeType.toString());
    switch (pageState) {
      case PageState.OnLeft:
        swipeDirectionSubject.add(SwipeDirection.Left);
        pageAnimController.animateTo(1).whenComplete(() => pageStateSubject.add(PageState.OnLeft));
        navBarAnimController.animateTo(0);
        break;
      case PageState.OnCenter:
        pageAnimController.animateTo(0).whenComplete(() => pageStateSubject.add(PageState.OnCenter));
        navBarAnimController.animateTo(0);
        break;
      case PageState.OnRight:
        swipeDirectionSubject.add(SwipeDirection.Right);
        pageAnimController.animateTo(1).whenComplete(() => pageStateSubject.add(PageState.OnRight));
        navBarAnimController.animateTo(1);
        break;
    }
  }

  void dispose() {
    swipeDirectionSubject.close();
    pageStateSubject.close();
  }
}
