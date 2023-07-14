import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/onboarding/models/onboarding_data.dart';
import 'package:mobidoc/features/onboarding/screen/onboarding_screen.dart';

/// Model for [OnboardingScreen].
class OnboardingScreenModel extends ElementaryModel {
  final List<OnboardingData> _onboardingDataList;


  List<OnboardingData> get onboardingDataList => _onboardingDataList;

  OnboardingScreenModel({required List<OnboardingData> onboardingDataList})
      : this._onboardingDataList = onboardingDataList;
}
