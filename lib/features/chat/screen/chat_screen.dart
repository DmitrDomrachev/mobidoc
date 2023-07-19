import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for [ChatScreen] module.
@RoutePage(name: AppRouteNames.chatScreen)
class ChatScreen extends StatelessWidget {
  /// Create an instance [ChatScreen].
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat screen'),
    );
  }
}
