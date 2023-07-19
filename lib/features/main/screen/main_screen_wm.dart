import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/main/screen/main_screen.dart';
import 'package:mobidoc/features/main/screen/main_screen_model.dart';

/// Factory for [MainScreenWM].
MainScreenWM mainScreenWMFactory(BuildContext _) {
  return MainScreenWM(MainScreenModel());
}

/// Widget model for [MainScreen].
class MainScreenWM extends WidgetModel<MainScreen, MainScreenModel>
    with ThemeWMMixin
    implements IMainScreenWidgetModel {
  /// Create an instance [MainScreenWM].
  MainScreenWM(MainScreenModel model) : super(model);
}

/// Interface of [IMainScreenWidgetModel].
abstract class IMainScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {}
