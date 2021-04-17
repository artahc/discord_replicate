import 'package:discord_ui_practice/view/home/channel_info_page/channel_member_all_list.dart';
import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: 55),
          Expanded(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                // color: Color(0xff303136),
                color: Color(0xff363940),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ChannelInfoHeader(),
                    _ChannelInfoButtons(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Color(0xff363940),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ChannelInfoInviteButton(),
                            ChannelInfoMember(),
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

class _ChannelInfoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff303136),
      alignment: Alignment.center,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "@ User",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Image.asset(
            "assets/more-options.png",
            height: 20,
            color: Color(0xffb9bbbe),
          )
        ],
      ),
    );
  }
}

class _ChannelInfoButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff303136),
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.only(top: 14, bottom: 10),
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
    ;
  }
}
