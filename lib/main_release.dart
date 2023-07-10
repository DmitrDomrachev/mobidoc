import 'package:mobidoc/config/app_config.dart';
import 'package:mobidoc/config/environment/build_types.dart';
import 'package:mobidoc/config/environment/environment.dart';
import 'package:mobidoc/config/urls.dart';
import 'package:mobidoc/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
    ),
  );

  run();
}
