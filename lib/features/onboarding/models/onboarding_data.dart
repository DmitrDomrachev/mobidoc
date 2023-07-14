/// Model with onboarding page data.
class OnboardingData {
  /// Path to image asset.
  final String imageAsset;

  /// Onboarding page title.
  final String title;

  /// Onboarding page body.
  final String body;

  /// Onboarding page continue button text.
  final String continueButtonText;

  /// Create an instance [OnboardingData].
  OnboardingData(
    this.imageAsset,
    this.title,
    this.body,
    this.continueButtonText,
  );
}
