import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/notification_card.dart';
import 'package:mobidoc/features/main/screen/main_screen.dart';

/// Notifications widget for [MainScreen].
class NotificationPages extends StatelessWidget {
  /// Create an instance [NotificationPages].
  const NotificationPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return SizedBox(
      height: 153,
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: NotificationCard(
              doctorType: 'Терапевт',
              selfAssessment: 8,
              date: '$index октября',
            ),
          );
        },
      ),
    );
  }
}
