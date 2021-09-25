import 'package:discord_ui_practice/external/app_icon.dart';
import 'package:discord_ui_practice/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelInfoPanel extends StatelessWidget {
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
              "# general",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ImageIcon(
            AssetImage(AppIcon.more_icon),
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
                  AssetImage(AppIcon.phone_icon),
                  size: 18,
                ),
                Text(
                  "Call",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                  ),
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
                  AssetImage(AppIcon.video_icon),
                  size: 20,
                ),
                Text(
                  "Video",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  ),
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
                  AssetImage(AppIcon.notification_icon),
                  size: 20,
                ),
                Text(
                  "Notification",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  ),
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
                  AssetImage(AppIcon.search_icon),
                  size: 20,
                ),
                Text(
                  "Search",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  ),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CircleContainer(
            size: Size(40, 40),
            color: Theme.of(context).colorScheme.primary,
            child: ImageIcon (
              AssetImage (AppIcon.add_user_icon),
            )
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Create Group DM",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
