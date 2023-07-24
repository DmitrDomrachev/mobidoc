import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/filled_card.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_filled_button.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';
import 'package:mobidoc/features/services/screen/services_screen_wm.dart';

/// Main widget for ServicesScreen module.
@RoutePage(name: AppRouteNames.servicesScreen)
class ServicesScreen extends ElementaryWidget<IServicesScreenWidgetModel> {
  /// Create an instance [ServicesScreen].
  const ServicesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultServicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServicesScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: wm.colorScheme.background,
        foregroundColor: wm.colorScheme.onBackground,
        centerTitle: false,
        title: Text('Сервисы', style: wm.textScheme.bold30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            StateNotifierBuilder(
              listenableState: wm.services,
              builder: (_, services) {
                final data = services as Result<List<Service>>;
                return switch (data) {
                  Loading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  Success() => _ServicesList(
                      services: data.value,
                    ),
                  Error() => FullWidthFilledButton(
                      child: const Text('Перезагрузить'),
                      onPressed: () {
                        wm.loadServices();
                      },
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ServicesList extends StatelessWidget {
  const _ServicesList({required this.services});

  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...services.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FilledCard(
                title: e.title,
                subtitle: e.description,
                onPressed: () {},
              ),
            )),
      ],
    );
  }
}
