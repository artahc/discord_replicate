import 'package:discord_ui_practice/domain/cubit/theme/theme_cubit.dart';
import 'package:discord_ui_practice/external/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationBar extends StatelessWidget {
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
                onPressed: (){
                  BlocProvider.of<ThemeCubit>(context).ChangeToLightTheme();
                },
                iconSize: 24,
                visualDensity: VisualDensity.compact,
                icon: ImageIcon(
                    AssetImage(AppIcon.discord_icon)
                ),
              ),
          ),

          Expanded(
            child: IconButton(
              onPressed: (){
                BlocProvider.of<ThemeCubit>(context).ChangeToDarkTheme();
              },
              iconSize: 19,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(
                  AssetImage(AppIcon.friend_icon)
              ),
            ),
          ),

          Expanded(
            child: IconButton(
              onPressed: (){
              },
              iconSize: 18,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(
                  AssetImage(AppIcon.search_icon)
              ),
            ),
          ),

          Expanded(
            child: IconButton(
              onPressed: (){
              },
              iconSize: 21,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(
                  AssetImage(AppIcon.mention_icon)
              ),
            ),
          ),

          Expanded(
            child: IconButton(
              onPressed: (){
              },
              iconSize: 20,
              visualDensity: VisualDensity.compact,
              icon: ImageIcon(
                  AssetImage(AppIcon.picture_icon)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
