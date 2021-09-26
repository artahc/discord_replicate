import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DirectMessageSearchPanel extends StatefulWidget {
  final Widget? body;
  final PanelController? panelController;

  const DirectMessageSearchPanel({Key? key, this.body, this.panelController}) : super(key: key);

  @override
  _DirectMessageSearchPanelState createState() => _DirectMessageSearchPanelState();
}

class _DirectMessageSearchPanelState extends State<DirectMessageSearchPanel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Theme.of (context).colorScheme.secondary,
      ),
    );
  }
}
