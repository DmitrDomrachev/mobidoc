import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/card/screen/card_screen_wm.dart';
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
          listenableState: wm.currentState,
          builder: (_, value) {
            final state = value ?? CardStateInit();
            return switch (state) {
              CardStateInit() => Center(
                  child: TextButton(
                    onPressed: () {
                      wm.openScanner();
                    },
                    child: const Text('Загрузить карту'),
                  ),
                ),
              CardStateLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              CardStateSuccess() => Text('Номер карты: ${state.data}'),
            };
          },
        ),
      ),
    );
  }
}
