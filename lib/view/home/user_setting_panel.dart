import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettingPanel extends StatefulWidget {
  UserSettingPanel({Key? key}) : super(key: key);

  @override
  State<UserSettingPanel> createState() => _UserSettingPanelState();
}

class _UserSettingPanelState extends State<UserSettingPanel> {
  late AuthBloc _authBloc = BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: _PersistentHeaderDelegate(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User Settings",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: () {
                                _authBloc.add(AuthEvent.signOutEvent());
                              },
                              icon: Icon(Icons.exit_to_app),
                              splashRadius: 17,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                              splashRadius: 17,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _PersistentHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => math.min(0, 10);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
