import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    extensions: [_lightColorScheme, _textTheme],
  );



  static final _lightColorScheme = AppColorScheme.light();
  static final _textTheme = AppTextTheme.base();
}
