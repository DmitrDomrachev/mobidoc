import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/onboarding/models/onboarding_data.dart';
import 'package:mobidoc/features/onboarding/screen/onboarding_screen.dart';

/// Model for [OnboardingScreen].
class OnboardingScreenModel extends ElementaryModel {
  final List<OnboardingData> _onboardingDataList;

  /// Variable for storing a list of onboarding datas.
  List<OnboardingData> get onboardingDataList => _onboardingDataList;

  /// Create an instance [OnboardingScreenModel].
  OnboardingScreenModel({required List<OnboardingData> onboardingDataList})
      : _onboardingDataList = onboardingDataList;
}
