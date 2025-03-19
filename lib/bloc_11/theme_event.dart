part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;
  ThemeChanged({
    required this.theme,
  });
}

class GetThemeEvent extends ThemeEvent {}
