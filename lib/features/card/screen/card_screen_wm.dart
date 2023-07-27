import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/card/screen/card_screen.dart';
import 'package:mobidoc/features/card/screen/card_screen_model.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/qr_scanner/screen/qr_scanner_sheet.dart';

/// Factory for [CardScreenWM].
CardScreenWM defaultCardScreenWidgetModelFactory(BuildContext _) {
  return CardScreenWM(CardScreenModel());
}

/// Widget model for [CardScreen].
class CardScreenWM extends WidgetModel<CardScreen, CardScreenModel>
    with ThemeWMMixin
    implements ICardScreenWidgetModel {
  final _currentState = StateNotifier<CardState>(initValue: CardStateInit());

  @override
  ListenableState<CardState> get currentState => _currentState;

  /// Create an instance [CardScreenWM].
  CardScreenWM(CardScreenModel model) : super(model);

  @override
  Future<void> openScanner() async {
    _currentState.accept(CardStateLoading());
    final result = await showModalBottomSheet<String>(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (_) => const QrScannerSheet(),
    );
    _currentState.accept(CardStateSuccess(result ?? ''));
  }
}

/// Interface of [CardScreenWM].
abstract class ICardScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Listener current state.
  ListenableState<CardState> get currentState;

  /// Function to start the qr code scanner.
  Future<void> openScanner();
}

/// CardScreen states.
sealed class CardState {}

/// Init State.
class CardStateInit extends CardState {}

/// Loading state.
class CardStateLoading extends CardState {}

/// Success state.
class CardStateSuccess extends CardState {
  /// Card number.
  final String data;

  /// Create an instance [CardStateSuccess].
  CardStateSuccess(this.data);
}
