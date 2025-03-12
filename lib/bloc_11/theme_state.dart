part of 'theme_bloc.dart';

enum TodoStatus { initial, loading, success, failure }

@immutable
final class ThemeState {
  final ThemeData themeData;

  ThemeState({
    required this.themeData,
  }) : super();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
