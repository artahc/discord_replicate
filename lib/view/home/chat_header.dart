import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff23272a),
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
                    "@ hace",
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
                color: Color(0xff99aab5),
              ),
              Image(
                width: 24,
                image: AssetImage("assets/video-camera.png"),
                color: Color(0xff99aab5),
              ),
              Image(
                width: 20,
                image: AssetImage("assets/group.png"),
                color: Color(0xff99aab5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
