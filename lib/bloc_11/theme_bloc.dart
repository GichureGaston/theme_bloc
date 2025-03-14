import 'package:bloc/bloc.dart';
import 'package:bloc_practice/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.Light]!)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(themeData: appThemeData[event.theme]!));
    });
  }
}
