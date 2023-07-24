import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/dash/screen/dash_screen.dart';
import 'package:mobidoc/features/dash/screen/dash_screen_model.dart';

/// Factory for [DashScreenWM].
DashScreenWM dashScreenWmFactory(
  BuildContext _,
) {
  final model = DashScreenModel();
  return DashScreenWM(model);
}

/// Widget model for [DashScreen].
class DashScreenWM extends WidgetModel<DashScreen, DashScreenModel>
    with ThemeWMMixin
    implements IDashScreenWidgetModel {
  /// Create an instance [DashScreenWM].
  DashScreenWM(DashScreenModel model) : super(model);
}

/// Interface of [IDashScreenWidgetModel].
abstract class IDashScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {}
