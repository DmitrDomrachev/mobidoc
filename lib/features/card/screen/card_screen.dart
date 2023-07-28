import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/medical_card/medical_card.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/features/card/screen/card_screen_wm.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_filled_button.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for CardScreen module.
@RoutePage(name: AppRouteNames.cardScreen)
class CardScreen extends ElementaryWidget<ICardScreenWidgetModel> {
  /// Create am instance [CardScreen].
  const CardScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultCardScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICardScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wm.colorScheme.background,
        foregroundColor: wm.colorScheme.onBackground,
        centerTitle: false,
        title: Text('Медицинская карта', style: wm.textScheme.bold30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StateNotifierBuilder(
          listenableState: wm.card,
          builder: (_, value) {
            final state = value ?? Loading<MedicalCard>();
            return switch (state) {
              Loading() => const SizedBox.shrink(),
              Success() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.value.name,
                      style: wm.textScheme.bold22,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Анамнез: ',
                      style: wm.textScheme.medium16,
                    ),
                    Text(
                      state.value.description,
                      style: wm.textScheme.regular16,
                    ),
                  ],
                ),
              Error() => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Карта с таким ID не найдена в базе.',
                        style: wm.textScheme.medium16,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 270,
                        child: FullWidthFilledButton(
                          onPressed: wm.loadCard,
                          child: const Text('Повторить'),
                        ),
                      ),
                    ],
                  ),
                )
            };
          },
        ),
      ),
    );
  }
}
