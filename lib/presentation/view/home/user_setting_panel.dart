import 'dart:math' as math;

import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettingPanel extends StatefulWidget {
  const UserSettingPanel({Key? key}) : super(key: key);

  @override
  State<UserSettingPanel> createState() => _UserSettingPanelState();
}

class _UserSettingPanelState extends State<UserSettingPanel> {
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
  late final NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (c, state) {
        state.whenOrNull(
          unauthenticated: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _navBloc.pushNamedAndRemoveUntil(context, Routes.welcome, (route) => false, true);
            });
          },
        );
      },
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
                          IconButton(
                            onPressed: () {
                              _authBloc.add(const AuthEvent.signOut());
                            },
                            icon: const Icon(Icons.exit_to_app),
                            splashRadius: 17,
                            visualDensity: VisualDensity.compact,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                            splashRadius: 17,
                            visualDensity: VisualDensity.compact,
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
