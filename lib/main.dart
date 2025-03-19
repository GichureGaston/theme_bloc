import 'package:bloc_practice/app_theme.dart';
import 'package:bloc_practice/bloc_11/theme_bloc.dart';
import 'package:bloc_practice/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc()..add(GetThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildTheme,
      ),
    );
  }

  Widget _buildTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App ',
      home: HomePage(),
      theme: appThemeData[state.theme],
    );
  }
}
