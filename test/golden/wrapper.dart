import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobidoc/assets/themes/theme_data.dart';
import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/build_types.dart';
import 'package:mobidoc/config/environment/environment.dart';
import 'package:mobidoc/config/urls.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/widgets/di_scope/di_scope.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Environment.init(
      buildType: BuildType.debug,
      config: AppConfig(
        url: Url.testUrl,
      ),
    );

    final scope = AppScope();

    return DiScope<IAppScope>(
      key: ObjectKey(scope),
      factory: () => scope,
      child: MaterialApp(
        theme: AppThemeData.lightTheme,

        /// Localization.
        locale: _localizations.first,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,

        home: Material(
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
