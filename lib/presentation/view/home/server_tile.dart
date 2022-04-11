import 'package:discord_replicate/domain/model/server.dart';
import 'package:flutter/material.dart';

class ServerTile extends StatelessWidget {
  final Server data;
  final bool selected;
  final Function? onPressed;

  const ServerTile({Key? key, required this.data, this.onPressed, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialButton(
          padding: const EdgeInsets.all(0),
          minWidth: 0,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            onPressed?.call();
          },
          child: AnimatedContainer(
            width: 45,
            height: 45,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(selected ? 16 : 28),
              color: selected ? Theme.of(context).buttonTheme.colorScheme!.primary : const Color(0xff363940),
            ),
          ),
        ),
        /*Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: selected ? 35 : 10,
            width: 5,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
          ),
        )*/
      ],
    );
  }
}
