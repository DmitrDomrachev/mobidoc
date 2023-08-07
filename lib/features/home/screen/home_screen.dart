import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/home/screen/home_screen_export.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for HomeScreen module.
@RoutePage(name: AppRouteNames.homeScreen)
class HomeScreen extends ElementaryWidget<IHomeScreenWidgetModel> {
  /// Create an instance [HomeScreen].
  const HomeScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultHomeScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomeScreenWidgetModel wm) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: wm.routes,
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: wm.colorScheme.background,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: wm.navigationBarItems,
            selectedItemColor: wm.colorScheme.selectedItem,
            unselectedItemColor: wm.colorScheme.unselectedItem,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}
