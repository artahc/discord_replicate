import 'package:flutter/material.dart';

class CustomSlideTransition extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;

  CustomSlideTransition({required this.nextPage, required this.currentPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return nextPage;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Stack(
              children: <Widget>[
                SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(-1.0, 0.0),
                  ).chain(CurveTween(curve: Curves.easeInOut)).animate(animation),
                  child: currentPage,
                ),
                SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInOut)).animate(animation),
                  child: nextPage,
                )
              ],
            );
          },
        );
}
