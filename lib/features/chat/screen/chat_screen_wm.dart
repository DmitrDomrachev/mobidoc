import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/chat/screen/chat_screen_export.dart';

abstract class IChatScreenWidgetModel extends IWidgetModel {}

ChatScreenWidgetModel defaultChatScreenWidgetModelFactory(
    BuildContext context) {
  return ChatScreenWidgetModel(ChatScreenModel());
}

// TODO: cover with documentation
/// Default widget model for ChatScreenWidget
class ChatScreenWidgetModel
    extends WidgetModel<ChatScreenWidget, ChatScreenModel>
    implements IChatScreenWidgetModel {
  ChatScreenWidgetModel(ChatScreenModel model) : super(model);
}
