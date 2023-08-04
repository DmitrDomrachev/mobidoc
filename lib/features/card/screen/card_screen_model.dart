import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/card/domain/medical_card_repository.dart';

/// Default Elementary model for CardScreen module.
class CardScreenModel extends ElementaryModel {
  /// Variable for accessing the repository of doctors.
  final MedicalCardRepository cardRepository;

  /// Create an instance [CardScreenModel].
  CardScreenModel(this.cardRepository);
}
