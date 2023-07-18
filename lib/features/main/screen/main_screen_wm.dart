import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/main/screen/main_screen_model.dart';
import 'package:mobidoc/features/main/screen/main_screen.dart';

abstract class IMainScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {}

MainScreenWidgetModel mainScreenWMFactory(BuildContext _) {
  return MainScreenWidgetModel(MainScreenModel());
}

// TODO: cover with documentation
/// Default widget model for MainScreenWidget
class MainScreenWidgetModel
    extends WidgetModel<MainScreenWidget, MainScreenModel>
    with ThemeWMMixin
    implements IMainScreenWidgetModel {
  MainScreenWidgetModel(MainScreenModel model) : super(model);
}
