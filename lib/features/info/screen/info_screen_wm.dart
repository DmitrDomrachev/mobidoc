import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/info/screen/info_screen.dart';
import 'package:mobidoc/features/info/screen/info_screen_model.dart';

/// Factory for [InfoScreenWM].
InfoScreenWM infoScreenWmFactory(
  BuildContext _,
) {
  final model = InfoScreenModel();
  return InfoScreenWM(model);
}

/// Widget model for [InfoScreen].
class InfoScreenWM extends WidgetModel<InfoScreen, InfoScreenModel>
    with ThemeWMMixin
    implements IInfoScreenWidgetModel {
  /// Create an instance [InfoScreenWM].
  InfoScreenWM(InfoScreenModel model) : super(model);
}

/// Interface of [InfoScreenWM].
abstract class IInfoScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {}
