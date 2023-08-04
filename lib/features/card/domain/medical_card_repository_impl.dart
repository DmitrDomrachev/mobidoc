import 'package:mobidoc/api/data/medical_card/medical_card.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/errors/request_exception.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/card/domain/medical_card_repository.dart';

/// MedicalCardRepository implementation.
class MedicalCardRepositoryImpl implements MedicalCardRepository {
  final ApiClient _client;

  /// Create an instance [MedicalCardRepositoryImpl].
  MedicalCardRepositoryImpl(this._client);

  @override
  Future<Result<MedicalCard>> getMedicalCard(int number) async {
    try {
      final cards = await _client.getMedicalCards();
      final card = cards.firstWhere((element) => element.number == number);
      return Success(card);
    } on RequestException catch (e) {
      return Error(e);
    } on StateError {
      return Error();
    }
  }
}
