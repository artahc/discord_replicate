import 'package:flutter/material.dart';

class CustomSlideTransition extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;

  CustomSlideTransition({required this.currentPage, required this.nextPage})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return nextPage;
    },
    transitionDuration: Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = CurveTween(curve: Curves.easeInOut);
      return Stack(
        children: <Widget>[
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(-1.0, 0.0),
            ).chain(curve).animate(animation),
            child: currentPage,
          ),
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(curve).animate(animation),
            child: nextPage,
          )
        ],
      );
    },
  );
}