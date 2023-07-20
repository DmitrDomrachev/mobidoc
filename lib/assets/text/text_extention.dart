import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 12_116_400.
  final TextStyle regular12;

  /// Text style 14_120_400.
  final TextStyle regular14;

  /// Text style 16_124_400.
  final TextStyle regular16;

  /// Text style 10_120_600.
  final TextStyle medium10;

  /// Text style 12_119_600.
  final TextStyle medium12;

  /// Text style 14_120_600.
  final TextStyle medium14;

  /// Text style 16_124_600.
  final TextStyle medium16;

  /// Text style 18_141_600.
  final TextStyle medium18;

  /// Text style 18_122_700.
  final TextStyle bold18;

  /// Text style 20_136_700.
  final TextStyle bold20;

  /// Text style 22_131_700.
  final TextStyle bold22;

  /// Text style 24_136_700.
  final TextStyle bold24;

  /// Text style 30_136_700.
  final TextStyle bold30;

  AppTextTheme._({
    required this.regular12,
    required this.regular14,
    required this.regular16,
    required this.medium10,
    required this.medium12,
    required this.medium14,
    required this.medium16,
    required this.medium18,
    required this.bold18,
    required this.bold20,
    required this.bold22,
    required this.bold24,
    required this.bold30,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular12 = AppTextStyle.regular12.value,
        regular14 = AppTextStyle.regular14.value,
        regular16 = AppTextStyle.regular16.value,
        medium10 = AppTextStyle.medium10.value,
        medium12 = AppTextStyle.medium12.value,
        medium14 = AppTextStyle.medium14.value,
        medium16 = AppTextStyle.medium16.value,
        medium18 = AppTextStyle.medium18.value,
        bold18 = AppTextStyle.bold18.value,
        bold20 = AppTextStyle.bold18.value,
        bold22 = AppTextStyle.bold22.value,
        bold24 = AppTextStyle.bold24.value,
        bold30 = AppTextStyle.bold30.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return copyWith(
      regular12: TextStyle.lerp(regular12, other.regular12, t),
      regular14: TextStyle.lerp(regular14, other.regular14, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      medium10: TextStyle.lerp(medium10, other.medium10, t),
      medium12: TextStyle.lerp(medium12, other.medium12, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      medium16: TextStyle.lerp(medium16, other.medium16, t),
      medium18: TextStyle.lerp(medium18, other.medium18, t),
      bold18: TextStyle.lerp(bold18, other.bold18, t),
      bold20: TextStyle.lerp(bold20, other.bold20, t),
      bold22: TextStyle.lerp(bold22, other.bold22, t),
      bold24: TextStyle.lerp(bold24, other.bold24, t),
      bold30: TextStyle.lerp(bold30, other.bold30, t),
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular12,
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? medium10,
    TextStyle? medium12,
    TextStyle? medium14,
    TextStyle? medium16,
    TextStyle? medium18,
    TextStyle? bold18,
    TextStyle? bold20,
    TextStyle? bold22,
    TextStyle? bold24,
    TextStyle? bold30,
  }) {
    return AppTextTheme._(
      regular12: regular12 ?? this.regular12,
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      medium10: medium10 ?? this.medium10,
      medium12: medium12 ?? this.medium12,
      medium14: medium14 ?? this.medium14,
      medium16: medium16 ?? this.medium16,
      medium18: medium18 ?? this.medium18,
      bold18: bold18 ?? this.bold18,
      bold20: bold20 ?? this.bold20,
      bold22: bold22 ?? this.bold22,
      bold24: bold24 ?? this.bold24,
      bold30: bold30 ?? this.bold30,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
