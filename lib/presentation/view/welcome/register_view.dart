import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'country_code_search_panel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with TickerProviderStateMixin {
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
  late final NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);

  late TabController _tabCtrl;
  final PanelController _bottomSheetCtrl = PanelController();
  final TextEditingController _registerCtrl = TextEditingController();
  final TextEditingController _countryCodeCtrl = TextEditingController();

  RegisterOptions _registerOption = RegisterOptions.Phone;

  void _showCountryCodeBottomSheet() {
    _bottomSheetCtrl.animatePanelToPosition(0.5, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  dispose() {
    _tabCtrl.dispose();
    _registerCtrl.dispose();
    super.dispose();
  }

  void _signUp() {
    _authBloc.add(AuthEvent.signUp(option: _registerOption, id: _registerCtrl.text));
  }

  void _onUserAuthenticated() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _navBloc.pushNamedAndRemoveUntil(context, Routes.landing, (route) => false, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (_, state) {
        state.whenOrNull(
          authenticated: (user) {
            _onUserAuthenticated();
          },
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("$e"),
              ),
            );
          },
        );
      },
      builder: (_, state) {
        return state.maybeWhen(
          authenticating: () {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
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
                boxShadow: const [],
                snapPoint: 0.5,
                renderPanelSheet: true,
                panelSnapping: true,
                panel: CountryCodeSearchPanel(
                  countryCodeSearchCtrl: _countryCodeCtrl,
                ),
                body: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    leading: SizedBox(
                      width: 45,
                      height: 45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          _navBloc.pop(context, true);
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
                                    option.name,
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
                                  duration: const Duration(milliseconds: 150),
                                  child: _registerOption == RegisterOptions.Email
                                      ? Container(
                                          key: const ValueKey(0),
                                        )
                                      : Container(
                                          key: const ValueKey(1),
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
                                                    style: Theme.of(context)
                                                        .inputDecorationTheme
                                                        .floatingLabelStyle
                                                        ?.copyWith(
                                                          fontSize: 10,
                                                          height: 1,
                                                          color: Theme.of(context).colorScheme.onPrimary,
                                                        ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
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
                                    duration: const Duration(seconds: 1),
                                    child: AppInputField(
                                      controller: _registerCtrl,
                                      labelText: _registerOption.name,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
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
                              child: const Text("Next"),
                              onPressed: _signUp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
