import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/qr_scanner/screen/qr_scanner_sheet_wm.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Main widget for QrScannerSheet module.
class QrScannerSheet
    extends ElementaryWidget<IQrScannerSheetWidgetModel> {
  /// Create an instance [QrScannerSheet].
  const QrScannerSheet({
    Key? key,
    WidgetModelFactory wmFactory = defaultQrScannerSheetWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IQrScannerSheetWidgetModel wm) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: wm.cancel,
                      child: const Text(
                        'Отмена',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Сканируйте QR-код.',
                    textAlign: TextAlign.center,
                    style: wm.textScheme.bold18,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: StateNotifierBuilder(
                  listenableState: wm.currentState,
                  builder: (_, state) {
                    return switch (state as ScanState) {
                      ScanStateInit() =>
                        const Text('Запрошены права на доступ к камере.'),
                      ScanStateSuccess() => MobileScanner(
                          fit: BoxFit.fill,
                          onDetect: wm.onDetect,
                        ),
                      ScanStateError() => Center(
                          child: TextButton(
                            onPressed: wm.openSettings,
                            child: const Text('Перейти в настройки'),
                          ),
                        ),
                    };
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
