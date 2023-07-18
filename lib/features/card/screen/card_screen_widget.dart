import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/card/screen/card_screen_export.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

// TODO: cover with documentation
/// Main widget for CardScreen module
@RoutePage(name: AppRouteNames.cardScreen)
class CardScreenWidget extends ElementaryWidget<ICardScreenWidgetModel> {
  const CardScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultCardScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICardScreenWidgetModel wm) {
    return Center(
      child: Text('Card screen'),
    );  }
}
