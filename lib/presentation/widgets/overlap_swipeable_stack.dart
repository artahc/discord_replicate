import 'package:discord_replicate/presentation/widgets/overlap_swipeable_stack_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OverlapSwipeableStack extends StatelessWidget {
  final OverlapSwipeableStackController channelViewController;

  final Widget? leftPage;
  final Widget? rightPage;
  final Widget frontPage;

  const OverlapSwipeableStack({Key? key, required this.channelViewController, required this.frontPage, this.leftPage, this.rightPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,
      onTapDown: (d) {},
      onHorizontalDragDown: channelViewController.onHorizontalDragDown,
      onHorizontalDragStart: channelViewController.onHorizontalDragStart,
      onHorizontalDragUpdate: (d) => channelViewController.onHorizontalDragUpdate(d, context),
      onHorizontalDragEnd: channelViewController.onHorizontalDragEnd,
      child: StreamBuilder<SwipeDirection?>(
        stream: channelViewController.swipeDirectionSubject.stream,
        initialData: null,
        builder: (_, __) {
          return Stack(
            children: [
              Visibility(
                visible: channelViewController.currentSwipeDirection == SwipeDirection.Right &&
                        channelViewController.currentPageState == PageState.OnCenter ||
                    channelViewController.currentPageState == PageState.OnRight,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                maintainInteractivity: false,
                maintainSemantics: false,
                child: leftPage ?? Container(),
              ),
              Visibility(
                visible: channelViewController.currentSwipeDirection == SwipeDirection.Left &&
                        channelViewController.currentPageState == PageState.OnCenter ||
                    channelViewController.currentPageState == PageState.OnLeft,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: rightPage ?? Container(),
              ),
              Positioned.fill(
                child: SlideTransition(
                  position: channelViewController.tween.animate(
                    CurvedAnimation(parent: channelViewController.pageAnimController, curve: Curves.easeInOutCubic),
                  ),
                  child: GestureDetector(
                    onTap: () => channelViewController.setState(PageState.OnCenter),
                    child: frontPage,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
