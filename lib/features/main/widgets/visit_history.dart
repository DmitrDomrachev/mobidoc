import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/visit_card.dart';

class VisitsHistory extends StatelessWidget {
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
              padding: EdgeInsets.only(bottom: 16),
              child: VisitCard(
                doctorType: 'Терапевт',
                date: '$index сентября 2020',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
