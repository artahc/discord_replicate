import 'package:discord_ui_practice/view/home/channel_info_page/channel_member_all_list.dart';
import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelInfoPage extends StatelessWidget {
  final Widget channelInfoHeader = Container(
    padding: EdgeInsets.all(20),
    child: Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "@ User",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Image.asset(
          "assets/more-options.png",
          height: 20,
          color: Color(0xffb9bbbe),
        )
      ],
    ),
  );

  final Widget channelButtons = Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Wrap(
            runSpacing: 7,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/phone-call.png",
                  color: Color(0xffb9bbbe),
                  height: 20,
                ),
              ),
              Text(
                "Call",
                style: TextStyle(color: Color(0xffb9bbbe), fontSize: 10),
              ),
            ],
          ),
        ),
        Expanded(
          child: Wrap(
            runSpacing: 7,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/video-camera.png",
                  color: Color(0xffb9bbbe),
                  height: 15,
                ),
              ),
              Text(
                "Video",
                style: TextStyle(color: Color(0xffb9bbbe), fontSize: 10),
              ),
            ],
          ),
        ),
        Expanded(
          child: Wrap(
            runSpacing: 7,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/notification.png",
                  color: Color(0xffb9bbbe),
                  height: 20,
                ),
              ),
              Text(
                "Notification",
                style: TextStyle(color: Color(0xffb9bbbe), fontSize: 10),
              ),
            ],
          ),
        ),
        Expanded(
          child: Wrap(
            runSpacing: 7,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/search.png",
                  color: Color(0xffb9bbbe),
                  height: 20,
                ),
              ),
              Text(
                "Search",
                style: TextStyle(color: Color(0xffb9bbbe), fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  final Widget channelInviteButton = Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CircleContainer(
          40,
          40,
          color: Color(0xff303136),
          child: Image.asset(
            "assets/add-user.png",
            color: Color(0xffb9bbbe),
            height: 12,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Create Group DM",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: 70),
          Flexible(
            flex: 1,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Color(0xff303136),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    channelInfoHeader,
                    Divider(
                      height: 0,
                      thickness: 2,
                      color: Color(0xff363940),
                    ),
                    channelButtons,
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Color(0xff363940),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            channelInviteButton,
                            ChannelMemberBody(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
