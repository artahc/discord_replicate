import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/bloc/server/server_state.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/direct_message_item.dart';
import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ServerList(),
          DirectMessageList(),
          SizedBox(
            width: 55,
          )
        ],
      ),
    );
  }
}

class ServerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff7289da),
                ),
                width: 45,
                height: 45,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/direct-message.png",
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.white70,
                indent: 10,
                endIndent: 10,
              ),
              BlocBuilder(
                bloc: context.read<ServerBloc>(),
                builder: (c, state) {
                  if (state is ServerLoadAllSuccess) {
                    return Column(
                      children: List.generate(
                        state.servers.length,
                        (index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: CircleContainer(
                            45,
                            45,
                            color: Color(0xff36393f),
                            child: Container(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else
                    return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DirectMessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff2c2f33),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Direct Message",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Image(height: 18, image: AssetImage("assets/direct-message.png"))
                ],
              ),
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Color(0xff202225), borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      minLines: 1,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 10,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Find or start a conversation",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/search.png",
                    height: 15,
                  )
                ],
              ),
            ),
            Flexible(
              child: BlocBuilder(
                  bloc: context.read<DirectMessageBloc>(),
                  builder: (c, state) {
                    if (state is DirectMessageLoadAllSuccess)
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(height: 5);
                            },
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return DirectMessageItem(
                                  "randomId", "Random User", UserStatus("emoji", "Working on stuff~2qqqqqqq"));
                            }),
                      );
                    else
                      return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
