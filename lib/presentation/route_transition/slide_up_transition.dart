import 'package:flutter/cupertino.dart';

class SlideUpTransition extends PageRouteBuilder {
  final Widget nextPage;

  SlideUpTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return nextPage;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = CurveTween(curve: Curves.easeOut);
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(animation),
              child: nextPage,
            );
          },
        );
}
