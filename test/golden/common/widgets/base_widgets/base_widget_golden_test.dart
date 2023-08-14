import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/doctor_card.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/filled_card.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_filled_button.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/notification_card.dart';

import '../../../wrapper.dart';

void main() {
  testGoldens('DoctorCard golden test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        widget: const Wrapper(
          child: DoctorCard(
            name: 'Ivanov Ivan Ivanovich',
            type: 'Ivanocka',
            info: 'Ivan ivan ivan ivan ivan ivan ivan ivan ivan ivan ivan ivan',
          ),
        ),
        name: 'default page',
      );
    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'doctor_card_test');
  });
  testGoldens('FilledCard golden test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        widget: const Wrapper(
          child: FilledCard(
            title: 'title',
            subtitle: 'subtitl esubtitle subtitle subtitle subtitle '
                'subtitle',
          ),
        ),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'filled_card_test');
  });
  testGoldens('NotificationCard golden test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        widget: const Wrapper(
          child: NotificationCard(
            doctorType: 'Ivanchuk',
            selfAssessment: 1,
            date: '31.31.3131',
          ),
        ),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'notification_card_test');
  });
  testGoldens('FullWidthFilledButton golden test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        widget: const Wrapper(
          child: FullWidthFilledButton(
            child: Text('Press'),
          ),
        ),
        name: 'disabled',
      )
      ..addScenario(
        widget: Wrapper(
          child: FullWidthFilledButton(
            child: const Text('Press'),
            onPressed: () {},
          ),
        ),
        name: 'enabled',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'full_width_filled_button_test');
  });
}
