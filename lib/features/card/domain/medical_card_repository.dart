import 'package:mobidoc/api/data/medical_card/medical_card.dart';
import 'package:mobidoc/api/data/result.dart';

/// Interface of the [MedicalCard] repository.
abstract interface class MedicalCardRepository {
  /// Function that returns a [MedicalCard] by number.
  Future<Result<MedicalCard>> getMedicalCard(int number);
}
