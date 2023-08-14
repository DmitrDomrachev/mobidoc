import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// TRest url.
  static String get testUrl => 'http://79.132.140.75/api/';

  /// Prod url.
  static String get prodUrl => 'http://79.132.140.75/api/';

  /// Dev url.
  static String get devUrl => 'http://79.132.140.75/api/';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
