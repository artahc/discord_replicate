import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum RegisterOptions { Phone, Email }

extension ParseToString on RegisterOptions {
  String value() {
    return this.toString().split('.').last;
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with TickerProviderStateMixin {
  late TabController _tabCtrl;
  late PanelController _bottomSheetCtrl;
  RegisterOptions _registerOption = RegisterOptions.Phone;

  void _showCountryCodeBottomSheet() {
    _bottomSheetCtrl.animatePanelToPosition(0.5, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    _bottomSheetCtrl = PanelController();
    super.initState();
  }

  @override
  dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        collapsed: Container(),
        controller: _bottomSheetCtrl,
        isDraggable: true,
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
        color: Theme.of(context).colorScheme.secondary,
        backdropColor: Colors.black,
        backdropEnabled: true,
        backdropOpacity: 1,
        borderRadius: BorderRadius.circular(5),
        backdropTapClosesPanel: true,
        boxShadow: [],
        snapPoint: 0.5,
        renderPanelSheet: true,
        panelSnapping: true,
        panel: const CountryCodeBottomSheetPanel(),
        body: Scaffold(
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
                  margin: const EdgeInsets.only(bottom: 25),
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
                                color: option == _registerOption
                                    ? Theme.of(context).textTheme.subtitle2!.color
                                    : Theme.of(context).colorScheme.onSecondary),
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
                                  width: 100,
                                  height: 55,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: MaterialButton(
                                    // color: Colors.white38,
                                    visualDensity: VisualDensity.compact,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: _showCountryCodeBottomSheet,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12, right: 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Country Code",
                                            style: Theme.of(context).inputDecorationTheme.floatingLabelStyle?.copyWith(
                                                  fontSize: 10,
                                                  height: 1,
                                                  color: Theme.of(context).colorScheme.onPrimary,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "+62",
                                            style: TextStyle(
                                              height: 1,
                                            ),
                                            overflow: TextOverflow.ellipsis,
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
                            duration: Duration(seconds: 1),
                            child: AppInputField(
                              labelText: _registerOption.value(),
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
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountryCodeBottomSheetPanel extends StatefulWidget {
  const CountryCodeBottomSheetPanel({Key? key}) : super(key: key);

  @override
  State<CountryCodeBottomSheetPanel> createState() => _CountryCodeBottomSheetPanelState();
}

class _CountryCodeBottomSheetPanelState extends State<CountryCodeBottomSheetPanel> {
  late TextEditingController countryCodeSearchCtrl;

  @override
  void initState() {
    countryCodeSearchCtrl = TextEditingController();
    countryCodeSearchCtrl.addListener(() {
      print("Listen");
    });
    super.initState();
  }

  @override
  void dispose() {
    countryCodeSearchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          AppInputField(
            hintText: "Search",
            prefixIcon: Container(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: ImageIcon(
                AssetImage(AppIcon.search_icon),
                size: 15,
                color: IconTheme.of(context).color,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 10),
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Country"),
                      Text("+0$index"),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, index) => SizedBox(
                height: 1,
              ),
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}