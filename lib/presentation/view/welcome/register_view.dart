import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum RegisterOptions { Phone, Email }

extension ParseToString on RegisterOptions {
  String value() {
    return this.toString().split('.').last;
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  late TabController _tabCtrl;
  late RegisterOptions _registerOption;

  @override
  initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _registerOption = RegisterOptions.Phone;
  }

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
            onPressed: () {},
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                "Enter phone or email",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TabBar(
                controller: _tabCtrl,
                onTap: (i) {
                  setState(() {
                    _registerOption = RegisterOptions.values[i];
                  });
                },
                indicator: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(5),
                ),
                tabs: RegisterOptions.values.map(
                  (option) {
                    return Tab(
                      child: Text(
                        option.value(),
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color:
                                option == _registerOption ? Theme.of(context).textTheme.subtitle2!.color : Theme.of(context).colorScheme.onSecondary),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Builder(
              builder: (c) {
                return Row(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 150),
                      child: _registerOption == RegisterOptions.Email
                          ? Container(
                              key: ValueKey(0),
                            )
                          : Container(
                              key: ValueKey(1),
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 25, right: 10),
                              width: 100,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: MaterialButton(
                                // color: Colors.white38,
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Country Code",
                                        style: Theme.of(context).inputDecorationTheme.floatingLabelStyle?.copyWith(height: 1.5),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        child: Text(
                                          "+62",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      transitionBuilder: (child, animation) {
                        var sizeTransition = SizeTransition(
                          sizeFactor: Tween<double>(begin: 0, end: 1).animate(animation),
                          axis: Axis.horizontal,
                          child: child,
                        );
                        return sizeTransition;
                      },
                      switchOutCurve: Curves.easeInOut,
                      switchInCurve: Curves.easeInOut,
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedContainer(
                        margin: const EdgeInsets.only(top: 25),
                        height: 55,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(5)),
                        duration: Duration(seconds: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                              child: Text(
                                _registerOption.value(),
                                style: Theme.of(context).inputDecorationTheme.floatingLabelStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            TextFormField(
                              cursorWidth: 3,
                              autofocus: true,
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Align(
                child: Text(
                  "View our Privacy Policy",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption!.copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Next"),
                  onPressed: () {
                    print("Register");
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
