import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/chat/screen/chat_screen_wm.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

// TODO: cover with documentation
/// Main widget for ChatScreen module
@RoutePage(name: AppRouteNames.chatScreen)
class ChatScreenWidget extends ElementaryWidget<IChatScreenWidgetModel> {
  const ChatScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultChatScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IChatScreenWidgetModel wm) {
    return Center(
      child: Text('Chat screen'),
    );  }
}
