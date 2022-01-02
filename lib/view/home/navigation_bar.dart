import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/route_transition/app_transition.dart';
import 'package:discord_replicate/view/home/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  late AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
  late NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              iconSize: 24,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(AssetImage(AppIcons.discord_icon)),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              iconSize: 19,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(AssetImage(AppIcons.friend_icon)),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                _navBloc.push(context, SlideUpTransition(nextPage: SearchPanel()), true);
              },
              iconSize: 18,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(AssetImage(AppIcons.search_icon)),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              iconSize: 21,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(AssetImage(AppIcons.mention_icon)),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _authBloc.add(AuthEvent.signOutEvent());
              },
              child: Center(
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(50),
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
