import 'package:flutter/material.dart';

class TestMain extends StatelessWidget {

  TestMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expanded(
        child: Container(
          color: Color(0xff202226),
          child: Align(
            child: MaterialButton(
              onPressed: () {
              },
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
