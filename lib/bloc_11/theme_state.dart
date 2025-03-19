part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, success, failure }

@immutable
final class ThemeState {
  final ThemeStatus status;

  final Exception? exception;
  final AppTheme theme;

  const ThemeState({
    this.status = ThemeStatus.initial,
    this.exception,
    this.theme = AppTheme.Dark,
  }) : super();

  @override
  List<dynamic> get props => [status, theme, exception];
}
