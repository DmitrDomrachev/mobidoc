import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository.dart';

/// Model for ServicesScreen module.
class ServicesScreenModel extends ElementaryModel {
  /// Variable for accessing the repository of services.
  final ServiceRepository serviceRepository;

  /// Create an instance [ServicesScreenModel].
  ServicesScreenModel(this.serviceRepository);
}
