import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:discord_replicate/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class ChannelInfoPanel extends StatefulWidget {
  final Channel channel;

  const ChannelInfoPanel({Key? key, required this.channel}) : super(key: key);

  @override
  State<ChannelInfoPanel> createState() => _ChannelInfoPanelState();
}

class _ChannelInfoPanelState extends State<ChannelInfoPanel> {
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
                    Container(
                      color: Theme.of(context).colorScheme.primary,
                      alignment: Alignment.center,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              widget.channel.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          ImageIcon(
                            AssetImage(AppIcons.more_icon),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                                  AssetImage(AppIcons.phone_icon),
                                  size: 18,
                                ),
                                Text(
                                  "Call",
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
                                  AssetImage(AppIcons.video_icon),
                                  size: 20,
                                ),
                                Text(
                                  "Video",
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
                                  AssetImage(AppIcons.notification_icon),
                                  size: 20,
                                ),
                                Text(
                                  "Notification",
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
                                  AssetImage(AppIcons.search_icon),
                                  size: 20,
                                ),
                                Text(
                                  "Search",
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: CustomListView<Member>(
                          elements: [],
                          builder: (_, user, index) {
                            return ChannelMemberTile(member: user);
                          },
                          before: [
                            AppButton(
                              size: Size(double.infinity, 60),
                              onPressed: () {},
                              highlightColor: Theme.of(context).colorScheme.primary,
                              splashColor: Theme.of(context).colorScheme.primary,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.zero,
                              childAlignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  CircleContainer(
                                    size: Size(35, 35),
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    color: Theme.of(context).colorScheme.primary,
                                    child: Icon(
                                      Icons.person_add,
                                      size: 17,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                  Text(
                                    "Invite Members  ",
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class ChannelMemberTile extends StatelessWidget {
  final Member member;

  const ChannelMemberTile({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {},
      size: Size(double.infinity, 65),
      highlightColor: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.primary,
      color: Colors.transparent,
      borderRadius: BorderRadius.zero,
      child: Row(
        children: [
          CircleContainer(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            size: Size(35, 35),
            color: Colors.white,
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                member.name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "Status",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
