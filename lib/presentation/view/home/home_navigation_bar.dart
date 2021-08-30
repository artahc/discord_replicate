import 'package:discord_ui_practice/domain/cubit/theme/theme_cubit.dart';
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
                    AssetImage("assets/discord.png")
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
                  AssetImage("assets/friends.png")
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
                  AssetImage("assets/search.png")
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
                  AssetImage("assets/mention.png")
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
                  AssetImage("assets/insert-picture-icon.png")
              ),
            ),
          ),
        ],
      ),
    );
  }
}
