import 'package:bloc/bloc.dart';
import 'package:bloc_practice/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    // on app restart gt theme from persistent storage and procees with it
    on<GetThemeEvent>((event, emit) async {
      emit(ThemeState(status: ThemeStatus.loading));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final theme = await prefs.getString('theme');

      emit(ThemeState(
          theme: AppTheme.values.byName(theme ?? 'dark'),
          status: ThemeStatus.success));
    });
// pesrsist theme in shared pref and emit new theme
    on<ThemeChanged>((event, emit) async {
      emit(ThemeState(status: ThemeStatus.loading));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // save the theme
      await prefs.setString('theme', event.theme.name);
      emit(ThemeState(theme: event.theme, status: ThemeStatus.success));
    });
  }
}
