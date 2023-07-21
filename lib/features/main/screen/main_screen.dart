import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/main/screen/main_screen_wm.dart';
import 'package:mobidoc/features/main/widgets/main_header.dart';
import 'package:mobidoc/features/main/widgets/notification_pages.dart';
import 'package:mobidoc/features/main/widgets/visits_history.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for MainScreen module.
@RoutePage(name: AppRouteNames.mainScreen)
class MainScreen extends ElementaryWidget<IMainScreenWidgetModel> {
  /// Create an instance [MainScreen].
  const MainScreen({
    Key? key,
    WidgetModelFactory wmFactory = mainScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMainScreenWidgetModel wm) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        MainHeader(),
        SizedBox(
          height: 34,
        ),
        NotificationPages(),
        SizedBox(
          height: 34,
        ),
        VisitsHistory(),
      ],
    );
  }
}
