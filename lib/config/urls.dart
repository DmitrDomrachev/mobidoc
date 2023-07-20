import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// TRest url.
  static String get testUrl => 'http://mobidoc.roketstorm.com/api/';

  /// Prod url.
  static String get prodUrl => 'http://mobidoc.roketstorm.com/api/';

  /// Dev url.
  static String get devUrl => 'https://localhost:9999/food/hs/ExchangeSotr';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
