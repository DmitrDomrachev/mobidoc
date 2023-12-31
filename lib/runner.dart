import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobidoc/features/app/app.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/firebase_options.dart';
import 'package:surf_logger/surf_logger.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  /// Fix orientation.
  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _initLogger();
  await _initFirebase();
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      final scope = AppScope();
      await scope.initTheme();
      runApp(App(scope));
    },
    (exception, stack) {
      // TODO(init-project): Инициализировать Crashlytics.
      // FirebaseCrashlytics.instance.recordError(exception, stack);.
    },
  );
}

void _initLogger() {
  // TODO(init-project): Инициализировать CrashlyticsRemoteLogStrategy.
  // RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());.
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
}
