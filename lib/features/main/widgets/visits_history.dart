import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/filled_card.dart';
import 'package:mobidoc/features/main/screen/main_screen.dart';

/// Widget with the history of visits for [MainScreen].
class VisitsHistory extends StatelessWidget {
  /// Create an instance [VisitsHistory].
  const VisitsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Последние посещения',
            style: AppTextTheme.of(context).bold20,
          ),
          const SizedBox(
            height: 20,
          ),
          ...List.generate(
            6,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FilledCard(
                title: 'Терапевт',
                subtitle: '$index сентября 2020',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
