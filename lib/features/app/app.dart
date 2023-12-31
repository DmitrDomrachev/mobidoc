import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobidoc/assets/themes/theme_data.dart';
import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/environment.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/service/theme/theme_service.dart';
import 'package:mobidoc/features/common/widgets/di_scope/di_scope.dart';
import 'package:mobidoc/persistence/storage/config_storage/config_storage_impl.dart';

/// App widget.
class App extends StatefulWidget {
  /// Scope of dependencies which need through all app's life.
  final AppScope appScope;

  /// Create an instance App.
  const App(this.appScope, {Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;
  late IThemeService _themeService;

  @override
  void initState() {
    super.initState();

    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    _themeService = _scope.themeService;

    final configStorage = ConfigSettingsStorageImpl();
    final environment = Environment<AppConfig>.instance();
    if (!environment.isRelease) {
      environment
        ..refreshConfigProxy(configStorage)
        ..createLogHistoryStrategy();
    }
    _requestPermission();
    _getToken();
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  Future<void> _requestPermission() async {
    final messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
  }

  Future<void> _getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('firebase token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: AnimatedBuilder(
        animation: _themeService,
        builder: (context, child) {
          return MaterialApp.router(
            theme: AppThemeData.lightTheme,

            /// Localization.
            locale: _localizations.first,
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _localizations,

            /// This is for navigation.
            routeInformationParser: _scope.router.defaultRouteParser(),
            routerDelegate: _scope.router.delegate(),
          );
        },
      ),
    );
  }
}

// You need to customize for your project.
const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
