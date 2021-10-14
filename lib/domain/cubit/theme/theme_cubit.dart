import 'package:discord_replicate/external/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.darkThemeData);

  void changeToDarkTheme() {
    emit(AppTheme.darkThemeData);
  }

  void changeToLightTheme() {
    emit(AppTheme.lightThemeData);
  }
}
