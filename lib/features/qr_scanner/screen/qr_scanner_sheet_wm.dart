import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/qr_scanner/screen/qr_scanner_sheet.dart';
import 'package:mobidoc/features/qr_scanner/screen/qr_scanner_sheet_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

/// Factory for [QrScannerSheetWM].
QrScannerSheetWM defaultQrScannerSheetWidgetModelFactory(
  BuildContext _,
) {
  return QrScannerSheetWM(QrScannerSheetModel());
}

/// Widget model for [QrScannerSheet].
class QrScannerSheetWM extends WidgetModel<QrScannerSheet, QrScannerSheetModel>
    with ThemeWMMixin
    implements IQrScannerSheetWidgetModel {
  final _currentState = StateNotifier<ScanState>(initValue: ScanStateInit());

  @override
  ListenableState<ScanState> get currentState => _currentState;

  /// Create an instance [QrScannerSheetWM].
  QrScannerSheetWM(QrScannerSheetModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _requestPermission();
  }

  @override
  void onDetect(BarcodeCapture barcodeCapture) {
    final data = barcodeCapture.barcodes.first.rawValue ?? '';
    if (data.length == 6) {
      Navigator.of(context).pop(int.parse(data));
    }
  }

  @override
  void openSettings() async {
    await openAppSettings();
    await _requestPermission();
  }

  @override
  void cancel() {
    Navigator.of(context).pop();
  }

  Future<void> _requestPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      _currentState.accept(ScanStateSuccess());
      return;
    }
    _currentState.accept(ScanStateError());
  }
}

/// Interface of [QrScannerSheetWM].
abstract class IQrScannerSheetWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Listener current state.
  ListenableState<ScanState> get currentState;

  /// The function is called when a barcode is detected.
  void onDetect(BarcodeCapture barcodeCapture);

  /// Open app settings.
  void openSettings();

  /// Cancel scan.
  void cancel();
}

/// QR scanner state.
sealed class ScanState {}

/// Init State.
class ScanStateInit extends ScanState {}

/// Success state.
class ScanStateSuccess extends ScanState {}

/// Error state.
class ScanStateError extends ScanState {}
