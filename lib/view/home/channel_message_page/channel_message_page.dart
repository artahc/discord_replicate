import 'package:discord_ui_practice/bloc/channel/channel_bloc.dart';
import 'package:discord_ui_practice/bloc/channel/channel_event.dart';
import 'package:discord_ui_practice/bloc/channel/channel_state.dart';
import 'package:discord_ui_practice/repository/channel_repository.dart';
import 'package:discord_ui_practice/view/home/channel_message_page/channel_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ChannelMessagePage extends StatefulWidget {
  @override
  _ChannelMessagePageState createState() => _ChannelMessagePageState();
}

class _ChannelMessagePageState extends State<ChannelMessagePage> {
  @override
  void initState() {
    context.read<ChannelBloc>().add(ChannelMessageLoadStarted());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          color: Color(0xff363940),
          child: Column(
            children: [
              ChatHeader(),
              ChatBody(),
              ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff303136),
      ),
      padding: EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image(
                image: AssetImage("assets/menu-button.png"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    context.read<ChannelRepository>().getCurrentChannelData()?.channelName ?? "",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: ClipOval(
                      child: Material(
                        color: Color(0xff47b380),
                        child: SizedBox(
                          width: 12,
                          height: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            children: [
              Image(
                width: 18,
                image: AssetImage("assets/phone-call.png"),
                color: Color(0xffb9bbbe),
              ),
              Image(
                width: 24,
                image: AssetImage("assets/video-camera.png"),
                color: Color(0xffb9bbbe),
              ),
              Image(
                width: 20,
                image: AssetImage("assets/group.png"),
                color: Color(0xffb9bbbe),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Wrap(
            spacing: 5,
            children: [
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                shape: CircleBorder(),
                onPressed: () {
                  // context.read<ChannelBloc>().add(ChannelMessageLoadStarted());
                  print("Image Pressed");
                },
                visualDensity: VisualDensity.comfortable,
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    color: Color(0xff303136),
                    child: Image.asset(
                      "assets/insert-picture-icon.png",
                      width: 20,
                      color: Color(0xffb9bbbe),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                shape: CircleBorder(),
                onPressed: () {
                  print("Gift Pressed");
                },
                visualDensity: VisualDensity.compact,
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    color: Color(0xff303136),
                    child: Image.asset(
                      "assets/giftbox.png",
                      width: 20,
                      color: Color(0xffb9bbbe),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 40),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: 100,
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff303136),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10,
                          ),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Message #general",
                          hintStyle: TextStyle(
                            color: Color(0xffb9bbbe),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset(
                        "assets/emoji.png",
                        height: 20,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 5),
        child: BlocBuilder<ChannelBloc, ChannelState>(
            bloc: context.read<ChannelBloc>(),
            builder: (_, state) {
              if (state is ChannelMessageLoadSuccess) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (_, index) {
                    return ChatItem(state.messages[index]);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  scrollDirection: Axis.vertical,
                );
              }
              /*else if (state is ChannelMessageLoadInProgress) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Shimmer.fromColors(
                        enabled: true,
                        child: Container(),
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey[200]);
                  },
                );
              }*/
              else
                return Container();
            }),
      ),
    );
  }
}
