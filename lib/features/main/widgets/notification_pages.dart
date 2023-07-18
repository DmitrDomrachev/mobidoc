import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/notification_card.dart';

class NotificationPages extends StatelessWidget {
  const NotificationPages({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return SizedBox(height: 153,
      child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all( 16.0),
              child: NotificationCard(
                  doctorType: 'Терапевт',
                  selfAssessment: 8,
                  date: '$index октябя'),
            );
          }),
    );
  }
}
