import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/doctor_card.dart';

/// MyDoctors screen.
class MyDoctors extends StatelessWidget {
  /// Create an instance [MyDoctors].
  const MyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Мои врачи',
          style: AppTextTheme.of(context).bold22,
        ),
        const SizedBox(
          height: 16,
        ),
        const DoctorCard(
          name: 'Доктор Курпатов',
          type: 'Терапевт',
          info: 'Опыт работы более 15 лет',
        ),
      ],
    );
  }
}
