import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 16_124_400.
  final TextStyle regular16;

  /// Text style 10_120_600.
  final TextStyle medium10;

  /// Text style 14_120_600.
  final TextStyle medium14;

  /// Text style 16_124_600.
  final TextStyle medium16;

  /// Text style 18_122_700.
  final TextStyle bold18;

  /// Text style 22_131_700.
  final TextStyle bold22;

  AppTextTheme._({
    required this.regular16,
    required this.medium10,
    required this.medium14,
    required this.medium16,
    required this.bold18,
    required this.bold22,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular16 = AppTextStyle.regular16.value,
        medium10 = AppTextStyle.medium10.value,
        medium14 = AppTextStyle.medium14.value,
        medium16 = AppTextStyle.medium16.value,
        bold18 = AppTextStyle.bold18.value,
        bold22 = AppTextStyle.bold22.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return copyWith(
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      medium10: TextStyle.lerp(medium10, other.medium10, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      medium16: TextStyle.lerp(medium16, other.medium16, t),
      bold18: TextStyle.lerp(bold18, other.bold18, t),
      bold22: TextStyle.lerp(bold22, other.bold22, t),
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular16,
    TextStyle? medium10,
    TextStyle? medium14,
    TextStyle? medium16,
    TextStyle? bold18,
    TextStyle? bold22,
  }) {
    return AppTextTheme._(
      regular16: regular16 ?? this.regular16,
      medium10: medium10 ?? this.medium10,
      medium14: medium14 ?? this.medium14,
      medium16: medium16 ?? this.medium16,
      bold18: bold18 ?? this.bold18,
      bold22: bold22 ?? this.bold22,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
