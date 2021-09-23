import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: SizedBox(
          width: 45,
          height: 45,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Welcome back!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "We're so excited to see you again!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      letterSpacing: 0.5,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 28),
                height: 55,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  cursorWidth: 3,
                  cursorRadius: Radius.circular(15),
                  maxLines: 1,
                  style: TextStyle(
                    height: 1,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle?.copyWith(
                            height: 0.8,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                      labelText: "Email or Phone Number"),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                height: 55,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  cursorWidth: 3,
                  cursorRadius: Radius.circular(15),
                  maxLines: 1,
                  style: TextStyle(
                    height: 1,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle?.copyWith(
                            height: 0.8,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                      labelText: "Password"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Align(
                child: Text(
                  "Forgot your password?",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption!.copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                child: Text(
                  "Use a password manager?",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption!.copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Login"),
                  onPressed: () {
                    print("Login");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
