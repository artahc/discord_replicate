import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff17191c),
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                print("Home Pressed");
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/discord.png",
                  width: 24,
                  color: Color(0xffb9bbbe),
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                print("Friends Pressed");
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/friends.png",
                  width: 19,
                  color: Color(0xffb9bbbe),
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                print("Search Pressed");
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/search.png",
                  width: 18,
                  color: Color(0xffb9bbbe),
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                print("Mention Pressed");
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/mention.png",
                  width: 21,
                  color: Color(0xffb9bbbe),
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                print("Profile Pressed");
              },
              child: ClipOval(
                child: Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    "assets/insert-picture-icon.png",
                    color: Color(0xffb9bbbe),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
