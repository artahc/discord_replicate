import 'package:flutter/cupertino.dart';

class SlideUpTransition extends PageRouteBuilder {
  final Widget nextPage;
  final bool fullscreenDialog;
  SlideUpTransition({required this.nextPage, this.fullscreenDialog = false})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return nextPage;
          },
          transitionDuration: Duration(milliseconds: 300),
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = CurveTween(curve: Curves.easeInOut);
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).chain(curve).animate(animation),
              child: nextPage,
            );
          },
        );
}
