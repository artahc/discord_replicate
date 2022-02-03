import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:flutter/widgets.dart';

class EmptyLandingPanel extends StatelessWidget {
  const EmptyLandingPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text("There is nothing in your page."),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AppNavigationBar(),
        )
      ],
    );
  }
}
