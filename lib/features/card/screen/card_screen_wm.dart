import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobidoc/api/data/medical_card/medical_card.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/card/screen/card_screen.dart';
import 'package:mobidoc/features/card/screen/card_screen_model.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/qr_scanner/screen/qr_scanner_sheet.dart';
import 'package:provider/provider.dart';

/// Factory for [CardScreenWM].
CardScreenWM defaultCardScreenWidgetModelFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  return CardScreenWM(
    CardScreenModel(appDependencies.cardRepository),
  );
}

/// Widget model for [CardScreen].
class CardScreenWM extends WidgetModel<CardScreen, CardScreenModel>
    with ThemeWMMixin
    implements ICardScreenWidgetModel {
  final _card =
      StateNotifier<Result<MedicalCard>>(initValue: Loading<MedicalCard>());

  @override
  ListenableState<Result<MedicalCard>> get card => _card;

  /// Create an instance [CardScreenWM].
  CardScreenWM(CardScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    SchedulerBinding.instance.addPostFrameCallback((_) => loadCard());
  }

  @override
  Future<void> loadCard() async {
    _card.accept(Loading<MedicalCard>());
    final number = await _openScanner();
    _card.accept(await model.cardRepository.getMedicalCard(number));
  }

  Future<int> _openScanner() async {
    final result = await showModalBottomSheet<int>(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (_) => const QrScannerSheet(),
    );
    return result ?? 0;
  }
}

/// Interface of [CardScreenWM].
abstract class ICardScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Listener current state.
  ListenableState<Result<MedicalCard>> get card;

  /// Function for downloading medical card.
  Future<void> loadCard();
}
