import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

/// Notification card widget.
class NotificationCard extends StatelessWidget {
  /// Create an instance [NotificationCard].
  const NotificationCard({
    required this.doctorType,
    required this.selfAssessment,
    required this.date,
    super.key,
  });

  /// Doctor type.
  final String doctorType;

  /// Self assessment value.
  final int selfAssessment;

  /// Notification date.
  final String date;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Уведомление',
              style: textTheme.medium16.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              doctorType,
              style: textTheme.medium18,
            ),
            const SizedBox(
              height: 13,
            ),
            _NotificationInfo(
              selfAssessment: selfAssessment,
              date: date,
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationInfo extends StatelessWidget {
  const _NotificationInfo({
    required this.selfAssessment,
    required this.date,
  });

  final int selfAssessment;
  final String date;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return Row(
      children: [
        Container(
          color: colorScheme.lineColor,
          height: 30,
          width: 2,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Самочувствие $selfAssessment/10',
              style: textTheme.medium12,
            ),
            Text(
              date,
              style: textTheme.regular12,
            ),
          ],
        ),
      ],
    );
  }
}
