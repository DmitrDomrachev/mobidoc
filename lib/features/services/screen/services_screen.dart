import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/filled_card.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';
import 'package:mobidoc/features/services/screen/services_screen_wm.dart';

/// Main widget for ServicesScreen module
@RoutePage(name: AppRouteNames.servicesScreen)
class ServicesScreenWidget
    extends ElementaryWidget<IServicesScreenWidgetModel> {
  const ServicesScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultServicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServicesScreenWidgetModel wm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Text(
            'Услуги',
            style: wm.textScheme.bold30,
          ),
          const SizedBox(
            height: 16,
          ),
          StateNotifierBuilder(
            listenableState: wm.services,
            builder: (_, services) =>
                _ServicesList(services: services as List<Service>),
          ),
        ],
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
