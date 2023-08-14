
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/build_types.dart';
import 'package:mobidoc/config/environment/environment.dart';
import 'package:mobidoc/config/urls.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/doctor_card.dart';
import 'package:mobidoc/features/common/widgets/di_scope/di_scope.dart';

void main() {
  testGoldens('DoctorCard golden test', (tester) async {

    Environment.init(
      buildType: BuildType.debug,
      config: AppConfig(
        url: Url.testUrl,
      ),
    );
    final scope = AppScope();
    await scope.initTheme();

    final widget = DiScope<IAppScope>(
      key: ObjectKey(scope),
      factory: () {
        return scope;
      },
      child: DoctorCard(
        name: 'Dr. John Doe',
        type: 'General Physician',
        info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        photo: null,
      ),
    );

    // Pump the widget using pumpWidget.
    await tester.pumpWidgetBuilder(widget);

    // Perform golden test comparison.
    await multiScreenGolden(tester,
        'doctor_card_golden'); // doctor_card_golden - the name of the golden file.
  });
}
