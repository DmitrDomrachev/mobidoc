import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/card/screen/card_screen_export.dart';

abstract class ICardScreenWidgetModel extends IWidgetModel {
}

CardScreenWidgetModel defaultCardScreenWidgetModelFactory(BuildContext context) {
  return CardScreenWidgetModel(CardScreenModel());
}

// TODO: cover with documentation
/// Default widget model for CardScreenWidget
class CardScreenWidgetModel extends WidgetModel<CardScreenWidget, CardScreenModel>
    implements ICardScreenWidgetModel {

  CardScreenWidgetModel(CardScreenModel model) : super(model);
}
