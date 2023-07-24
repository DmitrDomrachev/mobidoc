import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/home/screen/home_screen_export.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';

/// Factory [HomeScreenWM].
HomeScreenWM defaultHomeScreenWidgetModelFactory(BuildContext _) {
  return HomeScreenWM(HomeScreenModel());
}

/// Default widget model for [HomeScreen].
class HomeScreenWM extends WidgetModel<HomeScreen, HomeScreenModel>
    with ThemeWMMixin
    implements IHomeScreenWidgetModel {
  final _navBarItems = [
    const BottomNavigationBarItem(
      label: 'Главная',
      icon: Icon(Icons.home_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'Сервисы',
      icon: Icon(Icons.workspaces_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'Медкарта',
      icon: Icon(Icons.medical_information_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'Доктора',
      icon: Icon(Icons.chat_bubble_rounded),
    ),
  ];

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navBarItems;

  @override
  List<PageRouteInfo> get routes {
    return [
      MainRouter(),
      ServicesRouter(),
      const CardRouter(),
      DoctorsRouter(),
    ];
  }

  /// Create an instance [HomeScreenWM].
  HomeScreenWM(HomeScreenModel model) : super(model);
}

/// Interface of [HomeScreenWM].
abstract class IHomeScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Routes for [AutoTabsRouter.tabBar].
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;
}
