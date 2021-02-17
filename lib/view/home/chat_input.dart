
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  color: Color(0xff23272a),
                  child: Image.asset(
                    "assets/insert-picture-icon.png",
                    width: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  color: Color(0xff23272a),
                  child: Image.asset(
                    "assets/giftbox.png",
                    width: 20,
                    color: Colors.white70,
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
                  color: Color(0xff23272a),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(
                          color: Color(0xffffffff),
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
                            color: Color(0xff72767b),
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
