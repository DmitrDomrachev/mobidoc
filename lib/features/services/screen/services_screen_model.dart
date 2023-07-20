import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository.dart';

/// Default Elementary model for ServicesScreen module
class ServicesScreenModel extends ElementaryModel {
  final ServiceRepository serviceRepository;

  ServicesScreenModel(this.serviceRepository);
}
