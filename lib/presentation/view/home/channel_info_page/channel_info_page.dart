import 'package:discord_ui_practice/presentation/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width * 0.125) + 5),
            padding: EdgeInsets.only(right: 5),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ChannelInfoHeader(),
                    _ChannelInfoMenus(),
                    _ChannelInfoMember(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChannelInfoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "@ User",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ImageIcon(
            AssetImage("assets/more-options.png"),
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _ChannelInfoMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.only(top: 14, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Wrap(
              spacing: 7,
              direction: Axis.vertical,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/phone-call.png"),
                  size: 20,
                ),
                Text(
                  "Call",
                  style: Theme.of(context).accentTextTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 7,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/video-camera.png"),
                  size: 20,
                ),
                Text(
                  "Video",
                  style: Theme.of(context).accentTextTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 7,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/notification.png"),
                  size: 20,
                ),
                Text(
                  "Notification",
                  style: Theme.of(context).accentTextTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 7,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/search.png"),
                  size: 20,
                ),
                Text(
                  "Search",
                  style: Theme.of(context).accentTextTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChannelInfoMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChannelInfoInviteButton(),
            // TODO: add member widget here
            // ChannelInfoMember(),
          ],
        ),
      ),
    );
  }
}

class _ChannelInfoInviteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleContainer(
            40,
            40,
            color: Color(0xff303136),
            child: ImageIcon (
              AssetImage ("assets/add-user.png"),
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Create Group DM",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
