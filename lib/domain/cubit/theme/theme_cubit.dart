import 'package:discord_ui_practice/external/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.darkThemeData);

  void ChangeToDarkTheme() {
    emit(AppTheme.darkThemeData);
  }

  void ChangeToLightTheme() {
    emit(AppTheme.lightThemeData);
  }
}
